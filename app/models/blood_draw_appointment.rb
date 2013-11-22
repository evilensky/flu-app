class BloodDrawAppointment < ActiveRecord::Base
  MAX_APPOINTMENTS_PER_DAY = 10

  belongs_to :user

  validates :user, presence: true
  validates_presence_of :date, message: 'an appointment date is required'
  validates_uniqueness_of :user_id, message: 'a blood draw has already been scheduled'
  validate :appointment_day_not_full, :within_accepted_date_range

  def appointment_day_not_full
    if self.class.where(date: date).count == MAX_APPOINTMENTS_PER_DAY
      errors.add :date, 'there are no appointments available on that date'
    end
  end

  def within_accepted_date_range
    if date <= Date.today || date > (Date.today + 2.months)
      errors.add :date, 'the date may be as early as tomorrow and as late as two months from today'
    end
  end
end
