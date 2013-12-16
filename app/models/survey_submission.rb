class SurveySubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey

  serialize :response_data

  after_create :update_membership

  def update_membership
    record = SymptomsStartedOnSource.first
    date = response_data[record.question_data_label]

    if !date.blank?
      user.currently_ill_membership.update_column :symptoms_started_on, date
    end
  end
end
