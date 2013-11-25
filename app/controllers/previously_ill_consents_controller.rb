class PreviouslyIllConsentsController < ApplicationController
  def new
    @consent = PreviouslyIllConsent.new
  end

  def create
    @consent = PreviouslyIllConsent.new params.require(:previously_ill_consent).permit(:email)

    if @consent.save && User.create_with_random_password(email: @consent.email)
      user = User.find_by_email(@consent.email)
      @consent.update_column :user_id, user.id
      ParticipantMailer.blood_draw_appointment_email(user).deliver
      ResearcherMailer.previously_ill_consent_email(@consent).deliver
      render :success
    else
      flash.now[:danger] = "We're sorry, there was a problem submitting your consent: #{ @consent.errors.messages.values.map(&:first).join '; ' }."
      render :new
    end
  end
end
