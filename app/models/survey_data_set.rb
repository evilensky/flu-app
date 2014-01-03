class SurveyDataSet < User
  default_scope { joins(:currently_ill_membership).includes(:survey_submissions) }

  def datebirt
    if baseline 'Q1'
      begin
        (Date.parse(baseline('Q1'))).to_s :compact
      rescue
      end
    end
  end

  def fludx
    date = currently_ill_membership.tested_positive_on
    date && date.to_s(:compact)
  end

  def gender
    if baseline('Q2') == 1
      0
    elsif baseline('Q2') == 2
      1
    else
      9
    end
  end

  def weight
    baseline('Q3').to_s.rjust(3, '0')
  end

  def height
    (baseline('Q4').to_i * 12 + baseline('Q5').to_i).to_s.rjust(2, '0')
  end

  def flusym
    if baseline 'Q6'
      begin
        (Date.parse(baseline('Q6'))).to_s :compact
      rescue
      end
    end
  end

  def vaccine13
    b baseline('Q7')
  end

  def vaccine12
    b baseline('Q8')
  end

  def diab
    b baseline_q9.include?('9')
  end

  def copd
    b baseline_q9.include?('10')
  end

  def canc
    b baseline_q9.include?('12')
  end

  def imco
    b baseline_q9.include?('13')
  end

  def tran
    b baseline_q9.include?('14')
  end

  def hrtf
    b baseline_q9.include?('15')
  end

  def kidf
    b baseline_q9.include?('16')
  end

  def dial
    b baseline_q9.include?('17')
  end

  def nemu
    b baseline_q9.include?('18')
  end

  def cirr
    b baseline_q9.include?('19')
  end

  def hosp
    b day_14('Q11')
  end

  def icu
    b day_14('Q12')
  end

  def vent
    b day_14('Q13')
  end

  def osel
    b day_14('Q14')
  end

  def osel_d1
    day_14('Q15') && (Date.parse(day_14('Q15'))).to_s(:compact)
  end

  def osel_d2
    day_14('q16') && (Date.parse(day_14('Q16'))).to_s(:compact)
  end

  def pneu
    b day_14_q17.include?('43')
  end

  def bron
    b day_14_q17.include?('44')
  end

  def sinu
    b day_14_q17.include?('45')
  end

  def otit
    b day_14_q17.include?('46')
  end

  (1..14).each do |day|
    define_method("qday_#{ day }") do
      date = daily(day).created_at
      date && date.to_date.to_s(:compact)
    end
    define_method("rday_#{ day }") do
      date = daily(day).updated_at
      date && date.to_date.to_s(:compact)
    end
    define_method("fevr_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('20')
    end
    define_method("chls_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('21')
    end
    define_method("sthr_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('22')
    end
    define_method("coug_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('23')
    end
    define_method("dysp_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('24')
    end
    define_method("cong_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('25')
    end
    define_method("head_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('26')
    end
    define_method("myal_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('26')
    end
    define_method("arth_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('26')
    end
    define_method("chpa_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('26')
    end
    define_method("abpa_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('26')
    end
    define_method("dirh_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('26')
    end
    define_method("oslt_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('26')
    end
    define_method("atbx_#{ day }") do
      data = daily(day)
      b (data.response_data ? data.response_data['Q10'] : []).include?('26')
    end
  end

  private

  def baseline_q9
    baseline('Q9') || []
  end

  def day_14_q17
    baseline('Q9') || []
  end

  def b(x)
    x ? 1 : 0
  end

  def baseline(item)
    @baseline ||= (
      data = survey_submissions.includes(:survey).where("surveys.title = 'Baseline'").references(:surveys).first
      data && data.response_data
    )

    @baseline && @baseline[item]
  end

  def daily(day)
    data = nil

    if currently_ill_membership.symptoms_started_on
      survey_date = currently_ill_membership.symptoms_started_on + day - 1
      data = survey_submissions
          .includes(:survey)
          .where("surveys.title = 'Daily' AND DATE(survey_submissions.created_at) = ?", survey_date)
          .references(:surveys)
          .first
    end

    data || SurveySubmission.new
  end

  def day_14(item)
    @day_14 ||= (
      data = survey_submissions.includes(:survey).where("surveys.title = 'Day 14'").references(:surveys).first
      data && data.response_data
    )

    @day_14 && @day_14[item]
  end
end
