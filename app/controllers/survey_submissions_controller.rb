class SurveySubmissionsController < ApplicationController
  before_filter :validate_token

  def create
    @survey_submission = SurveySubmission.new survey_params

    if @survey_submission.save
      user = @survey_submission.user
      outstanding_survey = user.outstanding_survey_id(survey_params[:assignment_date])

      if outstanding_survey
        survey = Survey.find(outstanding_survey)
        flash[:notice] = if @survey_submission.survey.survey_completion_message
          @survey_submission.survey.survey_completion_message.success_body.html_safe
        else
          'Thank you for responding to the survey'
        end
        token = SurveyRules.new(outstanding_survey, user.id, survey_params[:assignment_date]).make_token
        redirect_to survey_url(survey, survey_token: token, user_id: user.id, date: survey_params[:assignment_date])
      else
        render :success
      end
    end
  end

  private

  def validate_token
    rules = SurveyRules.new(survey_params[:survey_id], survey_params[:user_id], survey_params[:assignment_date])
    unless rules.validate_token? params[:survey][:token]
      render text: 'Error!'
    end
  end

  def survey_params
    params.require(:survey).permit(:survey_id, :user_id, :assignment_date).tap do |whitelisted|
      whitelisted[:response_data] = params[:survey][:response_data]
    end
  end
end
