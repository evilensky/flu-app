require 'digest'

class SurveyRules
  def initialize(survey_id, user_id, assignment_date)
    @survey_id = survey_id
    @user_id = user_id
    @date = Date.parse(assignment_date || Date.today.to_s)
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

  def assignment_date
    @date
  end

  def make_token
    Digest::MD5.hexdigest id
  end

  def id
    "#{ @survey_id }+#{ @user_id.to_s.strip.downcase }+#{ @date.to_s :db }"
  end
end
