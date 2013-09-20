class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :data_label
      t.string :content
      t.references :survey, index: true
      t.string :input_type

      t.timestamps
    end
  end
end
