class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :survey_submissions, dependent: :destroy
  has_one :currently_ill_membership, dependent: :destroy
  has_one :previously_ill_membership, dependent: :destroy
  has_one :blood_draw_appointment, dependent: :destroy
end
