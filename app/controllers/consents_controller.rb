class ConsentsController < ApplicationController
  def new
    @consent = Consent.new
  end

  def create
    @consent = Consent.new params.require(:consent).permit(:email)

    if @consent.save && User.create_with_random_password(email: @consent.email)
      user = User.find_by_email(@consent.email)
      @consent.update_column :user_id, user.id
      ParticipantMailer.baseline_survey_email(user).deliver
      render :success
    else
      flash.now[:danger] = "We're sorry, there was a problem submitting your consent: #{ @consent.errors.messages.values.map(&:first).join '; ' }."
      render :new
    end
  end
end
