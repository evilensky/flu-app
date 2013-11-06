class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    survey_rules = SurveyRules.new params[:id], params[:user_id]

    if survey_rules.validate_token? params[:survey_token]
      @survey = survey_rules.current_survey
    else
      redirect_to root_url,
          alert: "Sorry, it looks like you're not scheduled to take a survey right now."
    end
  end

  def update
    @survey_submission = SurveySubmission.new(survey_id: params[:id])
    redirect_to :surveys
  end
end
