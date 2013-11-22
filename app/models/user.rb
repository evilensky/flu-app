class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :survey_submissions, dependent: :destroy
  has_one :currently_ill_membership, dependent: :destroy
  has_one :previously_ill_membership, dependent: :destroy
  has_one :blood_draw_appointment, dependent: :destroy
  has_one :consent, dependent: :destroy

  def self.create_with_random_password(attrs)
    require 'securerandom'
    password = SecureRandom.hex

    create attrs.merge(password: password, password_confirmation: password)
  end
end