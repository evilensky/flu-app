class SurveySubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey

  serialize :response_data
end
