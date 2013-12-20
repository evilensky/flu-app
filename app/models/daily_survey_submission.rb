class DailySurveySubmission < SurveySubmission
  default_scope { includes(:user, :survey).where("surveys.title = 'Daily'") }

  def unique_identifier
    user.participant_id
  end

  def questionnaire_day
    if user.currently_ill_membership
      (created_at.to_date - user.currently_ill_membership.symptoms_started_on + 1).to_i
    end
  end

  def fever
    b q10.include?('20')
  end

  def chills
    b q10.include?('21')
  end

  def sore_throat
    b q10.include?('22')
  end

  def cough
    b q10.include?('23')
  end

  def difficulty_breathing
    b q10.include?('24')
  end

  def runny_nose_or_sinus_congestion
    b q10.include?('25')
  end

  def headache
    b q10.include?('26')
  end

  def muscle_aches
    b q10.include?('27')
  end

  def joint_aches
    b q10.include?('28')
  end

  def chest_pain
    b q10.include?('29')
  end

  def abdominal_pain
    b q10.include?('30')
  end

  def diarrhea
    b q10.include?('31')
  end

  def taking_tamiflu
    b q10.include?('32')
  end

  def taking_antibiotics
    b q10.include?('33')
  end

  private

  def b(x)
    x ? 1 : 0
  end

  def q10 
    response_data['Q10'] || []
  end
end
