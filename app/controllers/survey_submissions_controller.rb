class SurveySubmissionsController < ApplicationController
  before_filter :validate_token

  def create
    @survey_submission = SurveySubmission.new survey_params

    if @survey_submission.save
      user = @survey_submission.user
      surveys_today = Survey.to_complete_on_day(user.day_of_study).map(&:id)
      surveys_completed = user.survey_submissions.where("DATE(survey_submissions.created_at) = ?", Date.today).map(&:survey_id)
      outstanding_survey = (surveys_today - surveys_completed).first

      if outstanding_survey
        survey = Survey.find(outstanding_survey)
        flash[:notice] = if @survey_submission.survey.survey_completion_message
          @survey_submission.survey.survey_completion_message.success_body.html_safe
        else
          'Thank you for responding to the survey'
        end
        redirect_to survey_url(survey, survey_token: SurveyRules.new(outstanding_survey, user.id).make_token, user_id: user.id)
      else
        render :success
      end
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
