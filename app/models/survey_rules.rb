require 'digest'

class SurveyRules
  def initialize(survey_id, user_id)
    @survey_id = survey_id
    @user_id = user_id
  end

  def validate_token?(token)
    token == make_token
  end

  def current_survey
    Survey.find @survey_id
  end

  def current_user
    User.find @user_id
  end

  def make_token
    Digest::MD5.hexdigest(@survey_id.to_s + @user_id.to_s.strip.downcase)
  end
end
