class MailPreview < MailView
  def baseline_survey_email
    user = User.first
    ParticipantMailer.baseline_survey_email(user)
  end

  def daily_survey_email
    user = User.first
    ParticipantMailer.daily_survey_email(user)
  end
end
