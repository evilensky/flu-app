class CreateConsents < ActiveRecord::Migration
  def up
    create_table :consents do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.string :email, null: false
      t.string :may_save_info
      t.string :may_not_save_info
      t.string :may_be_contacted
      t.string :may_not_be_contacted
      t.boolean :has_read_consent, null: false
      t.references :user, index: true
      t.string :type

      t.timestamps
    end
  end

  def down
    drop_table :consents
  end
end
