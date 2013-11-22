class BloodDrawAppointmentsController < ApplicationController
  before_filter :validate_token

  def new
    @blood_draw_appointment = BloodDrawAppointment.new appointment_params
  end

  def create
    @blood_draw_appointment = BloodDrawAppointment.new appointment_params

    if @blood_draw_appointment.save
      render :success
    else
      flash.now[:danger] = "We're sorry, there was a problem scheduling your blood draw: #{ @blood_draw_appointment.errors.messages.values.map(&:first).join '; ' }."
      render :new
    end
  end

  private

  def validate_token
    rules = BloodDrawAppointmentRules.new appointment_params[:user_id]

    if rules.validate_token? params[:token]
      @user = rules.current_user
      @token = params[:token]
    else
      redirect_to errors_url,
          alert: "Sorry, there was a problem scheduling your blood draw, please try back later."
    end
  end

  def appointment_params
    params.require(:blood_draw_appointment).permit(:date, :user_id)
  end
end
