class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :survey_submissions, dependent: :destroy
  has_one :currently_ill_membership, dependent: :destroy
  has_one :previously_ill_membership, dependent: :destroy
  has_one :blood_draw_appointment, dependent: :destroy
  has_one :consent, dependent: :destroy
  has_one :currently_ill_consent, dependent: :destroy
  has_one :previously_ill_consent, dependent: :destroy

  ID_PREFIX = { 'PreviouslyIll' => 'FPI', 'CurrentlyIll' => 'FCI' }

  def self.create_with_random_password(type, attrs)
    require 'securerandom'
    password = SecureRandom.hex

    participant_id = generate_random_id(type)
    while !User.find_by_participant_id(participant_id).nil?
      participant_id = generate_random_id(type)
    end

    create attrs.merge(password: password, password_confirmation: password, participant_id: participant_id)
  end

  def day_of_study
    membership = currently_ill_membership

    if membership && membership.enrolled_on && membership.symptoms_started_on
      Date.today - membership.symptoms_started_on + 1
    end
  end

  # find a survey that requires completion
  def outstanding_survey_id
    surveys_today = Survey.to_complete_on_day(day_of_study).map(&:id)
    surveys_completed = survey_submissions
        .where("DATE(survey_submissions.created_at) = ?", Date.today)
        .map(&:survey_id)

    (surveys_today - surveys_completed).first
  end

  def enrolled_on
    currently_ill_membership.try(:enrolled_on) ||
      previously_ill_membership.try(:enrolled_on)
  end

  private

  def self.generate_random_id(type)
    ID_PREFIX[type] + rand(10000).to_s.rjust(4, '0')
  end
end
