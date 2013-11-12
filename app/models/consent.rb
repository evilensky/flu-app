class Consent < ActiveRecord::Base
  validates :email, presence: true
end
