class Survey < ActiveRecord::Base
  has_many :questions
  has_many :responses, through: :questions
  has_many :survey_submissions

  validates :title, presence: true

  serialize :days_to_administer

  def self.to_complete_on_day(day_of_study)
    all.select do |survey|
      survey.days_to_administer.include? day_of_study
    end
  end
end
