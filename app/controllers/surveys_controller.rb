class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def update
    @survey_submission = SurveySubmission.new(survey_id: params[:id])
    redirect_to :surveys
  end
end
