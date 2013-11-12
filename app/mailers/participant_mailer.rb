class ParticipantMailer < ActionMailer::Base
  default from: "fluomics@northwestern.edu"

  def baseline_survey_email(user)
    mail to: user.email,
         subject: 'Fluomics: Baseline Survey'
  end
end
