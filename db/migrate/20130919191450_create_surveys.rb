class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title, null: false
      t.text :days_to_administer

      t.timestamps
    end
  end
end
