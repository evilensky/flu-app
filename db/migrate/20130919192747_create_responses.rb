class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :label
      t.integer :value
      t.references :question, index: true

      t.timestamps
    end
  end
end
