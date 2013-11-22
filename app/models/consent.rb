class Consent < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :email, message: 'email is required'
  validates_uniqueness_of :email, message: 'that email address has already been used'
end
