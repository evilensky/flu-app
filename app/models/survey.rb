class Survey < ActiveRecord::Base
  has_many :questions
  has_many :responses, through: :questions
  has_many :survey_submissions
end
