class CreatePreviouslyIllMemberships < ActiveRecord::Migration
  def change
    create_table :previously_ill_memberships do |t|
      t.references :user, index: true
      t.date :consented_on
      t.date :enrolled_on
      t.date :symptoms_started_on

      t.timestamps
    end
  end
end
