class CurrentlyIllMembership < ActiveRecord::Base
  belongs_to :user

  after_commit :notify_of_flu_test_results

  delegate :participant_id, to: :user, prefix: false, allow_nil: true

  def notify_of_flu_test_results
    if tested_positive_on_changed? && !tested_positive_on.nil?
      surveys = Survey.to_complete_on_day user.day_of_study
      ParticipantMailer.positive_flu_test_email(user, surveys).deliver
    elsif tested_negative_on_changed? && !tested_negative_on.nil?
      ParticipantMailer.negative_flu_test_email(user).deliver
    end
  end
end
