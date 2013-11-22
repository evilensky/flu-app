class BloodDrawAppointmentRules
  def initialize(user_id)
    @user_id = user_id
  end

  def validate_token?(token)
    token == make_token
  end

  def current_user
    User.find @user_id
  end

  def make_token
    "blood-draw-appointment#{ @user_id }"
  end
end
