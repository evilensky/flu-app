class CreateConsents < ActiveRecord::Migration
  def change
    create_table :consents do |t|
      t.string :email, null: false

      t.timestamps
    end
  end
end
