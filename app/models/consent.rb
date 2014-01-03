class Consent < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :email, message: 'email is required'
  validates_uniqueness_of :email, message: 'that email address has already been used'

  delegate :participant_id, to: :user, prefix: false, allow_nil: true
  delegate :enrolled_on, to: :user, prefix: false, allow_nil: true

  def participant_full_name
    "#{ first_name } #{ last_name }"
  end
end
