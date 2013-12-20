class DayFourteenSurveySubmission < SurveySubmission
  default_scope { includes(:user, :survey).where("surveys.title = 'Day 14'") }

  def unique_identifier
    user.participant_id
  end

  def hospitalized
    b response_data['Q11']
  end

  def icu
    b response_data['Q12']
  end

  def mech_vent
    b response_data['Q13']
  end

  def tamiflu
    b response_data['Q14']
  end

  def tamiflu_date1
    b response_data['Q15']
  end

  def tamiflu_date2
    b response_data['Q16']
  end

  def pneumonia
    b q17.include?('43')
  end

  def bronchitis
    b q17.include?('44')
  end

  def sinusitis
    b q17.include?('45')
  end

  def otitis
    b q17.include?('46')
  end

  private

  def b(x)
    x ? 1 : 0
  end

  def q17
    response_data['Q17'] || []
  end
end
