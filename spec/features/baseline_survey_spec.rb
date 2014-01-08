require 'spec_helper'

feature 'Baseline survey' do
  fixtures :surveys, :users

  scenario 'incorrect token' do
    visit "/surveys/#{ surveys(:baseline).id }?user_id=#{ users(:currently_ill_participant1).id }&survey_token=baz"

    expect(page).to have_text("Sorry, it looks like you're not scheduled to take a survey right now.")
  end

  scenario 'correct token' do
    token = SurveyRules.new(surveys(:baseline).id, users(:currently_ill_participant1).id, '2014-01-01').make_token
    visit "/surveys/#{ surveys(:baseline).id }?user_id=#{ users(:currently_ill_participant1).id }&date=2014-01-01&survey_token=#{ token }"

    expect(page).to have_text('Baseline survey January 1, 2014')
  end
end
