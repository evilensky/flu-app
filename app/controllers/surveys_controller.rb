class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    survey_rules = SurveyRules.new params[:id], params[:user_id]

    if survey_rules.validate_token? params[:survey_token]
      @survey = survey_rules.current_survey
      @user = survey_rules.current_user
      @survey_token = params[:survey_token]
    else
      redirect_to errors_url,
          alert: "Sorry, it looks like you're not scheduled to take a survey right now."
    end
  end

  def update
    @survey_submission = SurveySubmission.new(survey_id: params[:id])
    redirect_to :surveys
  end
end
