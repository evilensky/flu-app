class CreateBloodDrawAppointments < ActiveRecord::Migration
  def change
    create_table :blood_draw_appointments do |t|
      t.references :user, index: true, null: false, unique: true
      t.date :date, null: false

      t.timestamps
    end
  end
end
