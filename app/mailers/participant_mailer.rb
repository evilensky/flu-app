class ParticipantMailer < ActionMailer::Base
  default from: "fluomics@northwestern.edu"

  def baseline_survey_email(user)
    @user = user
    @survey = Survey.find_by_title 'Baseline'
    mail to: @user.email,
         subject: 'Fluomics: Baseline Survey'
  end

  def daily_survey_email(user)
    @user = user
    @survey = Survey.find_by_title 'Daily'
    mail to: @user.email,
         subject: 'Fluomics: Daily Survey'
  end
end
