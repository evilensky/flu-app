class ConsentsController < ApplicationController
  def new
    @consent = Consent.new
  end

  def create
    @consent = Consent.new params.require(:consent).permit(:email)

    if @consent.save
      user = User.create_with_random_password email: @consent.email
      @consent.update_column user_id: user.id
      ParticipantMailer.baseline_survey_email(user).deliver
      render :success
    else
      render :new
    end
  end
end
