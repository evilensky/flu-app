class CreateSurveySubmissions < ActiveRecord::Migration
  def up
    create_table :survey_submissions do |t|
      t.references :user, index: true
      t.references :survey, index: true
      t.text :response_data

      t.timestamps
    end
  end

  def down
    drop_table :survey_submissions
  end
end
