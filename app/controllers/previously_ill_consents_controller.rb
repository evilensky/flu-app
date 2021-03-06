class PreviouslyIllConsentsController < ApplicationController
  def new
    @consent = PreviouslyIllConsent.new
  end

  def create
    @consent = PreviouslyIllConsent.new params.require(:previously_ill_consent).permit(:may_save_info, :may_not_save_info, :may_be_contacted, :may_not_be_contacted, :has_read_consent, :first_name, :last_name, :date_of_birth, :email)

    if @consent.save && User.create_with_random_password('PreviouslyIll', { email: @consent.email })
      user = User.find_by_email(@consent.email)
      @consent.update_column :user_id, user.id
      PreviouslyIllMembership.create user: user, consented_on: Date.today
      ParticipantMailer.blood_draw_appointment_email(user).deliver
      ResearcherMailer.previously_ill_consent_email(@consent).deliver
      redirect_to new_blood_draw_appointment_url(token: BloodDrawAppointmentRules.new(user.id).make_token, blood_draw_appointment: { user_id: user.id })
    else
      flash.now[:danger] = "We're sorry, there was a problem submitting your consent: #{ @consent.errors.messages.values.map(&:first).join '; ' }."
      render :new
    end
  end
end
