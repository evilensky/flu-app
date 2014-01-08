class AddAssignmentDateToSurveySubmissions < ActiveRecord::Migration
  def change
    add_column :survey_submissions, :assignment_date, :date
  end
end
