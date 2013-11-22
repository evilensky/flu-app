class Consent < ActiveRecord::Base
  validates_presence_of :email, message: 'email is required'
  validates_uniqueness_of :email, message: 'that email address has already been used'
end
