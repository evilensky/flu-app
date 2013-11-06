class CreateBloodDrawAppointments < ActiveRecord::Migration
  def change
    create_table :blood_draw_appointments do |t|
      t.references :user, index: true
      t.date :date

      t.timestamps
    end
  end
end
