class SurveySubmissionsController < ApplicationController
  before_filter :validate_token

  def create
    @survey_submission = SurveySubmission.new survey_params

    if @survey_submission.save
      render :success
    end
  end

  private

  def validate_token
    rules = SurveyRules.new(survey_params[:survey_id], survey_params[:user_id])
    unless rules.validate_token? params[:survey][:token]
      render text: 'Error!'
    end
  end

  def survey_params
    params.require(:survey).permit(:survey_id, :user_id).tap do |whitelisted|
      whitelisted[:response_data] = params[:survey][:response_data]
    end
  end
end
