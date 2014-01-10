class SurveyCompletion < User
  default_scope { joins(:currently_ill_membership).includes(:survey_submissions) }

  Survey.all.each do |survey|
    if survey.days_to_administer.length > 1
      survey.days_to_administer.each do |day|
        define_method "#{ survey.title }_day_#{ day }_completed?" do
          survey_submissions.includes(:user).to_a.index {|s| s.user.day_of_study(s.assignment_date) == day } != nil
        end
      end
    else
      define_method "#{ survey.title }_completed?" do
        survey_submissions.exists? survey.id
      end
    end
  end
end
