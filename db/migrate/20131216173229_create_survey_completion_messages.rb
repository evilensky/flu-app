class CreateSurveyCompletionMessages < ActiveRecord::Migration
  def change
    create_table :survey_completion_messages do |t|
      t.references :survey, index: true
      t.text :success_body

      t.timestamps
    end
  end
end
