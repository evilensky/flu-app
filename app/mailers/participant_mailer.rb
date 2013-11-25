class ParticipantMailer < ActionMailer::Base
  default from: "fluomics@northwestern.edu"

  def baseline_survey_email(user)
    @user = user
    @survey = Survey.find_by_title 'Baseline'
    mail to: @user.email,
         subject: 'Fluomics: Baseline Survey'
  end

  def daily_survey_email(user, surveys)
    @user = user
    @surveys = surveys
    mail to: @user.email,
         subject: 'Fluomics: Daily Survey'
  end

  def blood_draw_appointment_email(user)
    require 'prawn'
    Prawn::Document.generate('tmp/consent.pdf') do
      text 'You consented!'
    end
    attachments['consent.pdf'] = File.read('tmp/consent.pdf')
    @user = user
    mail to: @user.email,
         subject: 'Fluomics: Blood draw appointment'
  end
end
