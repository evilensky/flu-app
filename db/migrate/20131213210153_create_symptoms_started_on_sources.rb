class CreateSymptomsStartedOnSources < ActiveRecord::Migration
  def change
    create_table :symptoms_started_on_sources do |t|
      t.string :question_data_label

      t.timestamps
    end
  end
end
