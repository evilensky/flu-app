class CreateCurrentlyIllMemberships < ActiveRecord::Migration
  def change
    create_table :currently_ill_memberships do |t|
      t.references :user, index: true
      t.date :consented_on
      t.date :enrolled_on
      t.date :symptoms_started_on
      t.date :tested_positive_on
      t.date :tested_negative_on

      t.timestamps
    end
  end
end
