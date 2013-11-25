class ResearcherMailer < ActionMailer::Base
  default from: "fluomics.northwestern.edu"

  def previously_ill_consent_email(consent)
    @consent = consent
    mail to: User.where(admin: true).map(&:email),
         subject: 'Fluomics: New home consent'
  end
end
