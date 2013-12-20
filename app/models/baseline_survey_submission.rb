class BaselineSurveySubmission < SurveySubmission
  default_scope { includes(:user, :survey).where("surveys.title = 'Baseline'") }

  def unique_identifier
    user.participant_id
  end

  def age
    response_data['Q1']
  end

  def gender
    if response_data['Q2'] == 1
      0
    elsif response_data['Q2'] == 2
      1
    end
  end

  def weight
    "#{ response_data['Q3'] } lbs."
  end

  def height
    "#{ response_data['Q4'] }ft. #{ response_data['Q5'] }in."
  end

  def date_flu
    response_data['Q6']
  end

  def vaccine13
    b response_data['Q7']
  end

  def vaccine12
    b response_data['Q8']
  end

  def diabetes
    b q9.include?('9')
  end

  def copd
    b q9.include?('10')
  end

  def asthma
    b q9.include?('11')
  end

  def cancer
    b q9.include?('12')
  end

  def immune_compromise
    b q9.include?('13')
  end

  def transplant
    b q9.include?('14')
  end

  def heart_f
    b q9.include?('15')
  end

  def kidney_f
    b q9.include?('16')
  end

  def dialysis
    b q9.include?('17')
  end

  def neuro_muscular
    b q9.include?('18')
  end

  def cirrhosis
    b q9.include?('19')
  end

  private

  def q9
    response_data['Q9'] || []
  end

  def b(x)
    x ? 1 : 0
  end
end
