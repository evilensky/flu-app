class CreateConsents < ActiveRecord::Migration
  def up
    create_table :consents do |t|
      t.string :email, null: false
      t.references :user, index: true

      t.timestamps
    end
  end

  def down
    drop_table :consents
  end
end
