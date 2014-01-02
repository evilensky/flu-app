class ParticipantMailer < ActionMailer::Base
  default from: "fluomics@northwestern.edu"

  def negative_flu_test_email(user)
    mail to: user.email,
         subject: 'Flu-Omics: Status'
  end

  def positive_flu_test_email(user, surveys)
    @user = user
    @surveys = surveys
    mail to: @user.email,
         subject: 'Flu-Omics: Status'
  end

  def baseline_survey_email(user)
    @user = user
    @survey = Survey.find_by_title 'Baseline'
    mail to: @user.email,
         subject: 'Flu-Omics: Baseline Survey'
  end

  def daily_survey_email(user, surveys)
    @user = user
    @surveys = surveys
    mail to: @user.email,
         subject: 'Flu-Omics: Daily Survey'
  end

  def blood_draw_appointment_email(user)
    require 'prawn'
    path = File.join(Rails.root, "tmp/consent-#{ Time.now.to_f }.pdf")
    ac = ActionController::Base.new
    body = ac.render_to_string(partial: 'previously_ill_consents/consent', layout: false)
        .gsub(/<[^>]+>/, '')
    body << ac.render_to_string(partial: 'previously_ill_consents/responses', layout: false, locals: { consent: user.previously_ill_consent })
    Prawn::Document.generate(path) do
      text body, inline_format: true
    end
    attachments['consent.pdf'] = File.read(path)
    @user = user
    mail to: @user.email,
         subject: 'Flu-Omics: Blood draw appointment'
  end
end
