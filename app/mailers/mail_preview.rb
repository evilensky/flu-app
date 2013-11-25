class MailPreview < MailView
  def baseline_survey_email
    user = User.first
    ParticipantMailer.baseline_survey_email(user)
  end

  def daily_survey_email
    user = User.first
    surveys = ['Daily', 'Day 14'].map {|t| Survey.find_by_title(t) }
    ParticipantMailer.daily_survey_email user, surveys
  end

  def blood_draw_appointment_email
    user = User.first
    ParticipantMailer.blood_draw_appointment_email user
  end

  def previously_ill_consent_email
    consent = PreviouslyIllConsent.first
    ResearcherMailer.previously_ill_consent_email consent
  end
end
