require 'spec_helper'

feature 'Daily survey' do
  fixtures :surveys, :users, :currently_ill_memberships

  scenario 'when an incorrect token is provided' do
    visit "/surveys/#{ surveys(:daily).id }?user_id=#{ users(:currently_ill_participant1).id }&survey_token=baz"

    expect(page).to have_text("Sorry, it looks like you're not scheduled to take a survey right now.")
  end

  scenario 'on day 1 of symptoms being present' do
    token = SurveyRules.new(surveys(:daily).id, users(:currently_ill_participant1).id, '2014-01-01').make_token
    visit "/surveys/#{ surveys(:daily).id }?user_id=#{ users(:currently_ill_participant1).id }&date=2014-01-01&survey_token=#{ token }"

    expect(page).to have_text('Daily survey January 1, 2014')

    click_button 'Submit'

    expect(page).to have_text('Thank you for responding to the survey')
  end

  scenario 'on day 14 of symptoms being present' do
    token = SurveyRules.new(surveys(:daily).id, users(:currently_ill_participant1).id, '2014-01-14').make_token
    visit "/surveys/#{ surveys(:daily).id }?user_id=#{ users(:currently_ill_participant1).id }&date=2014-01-14&survey_token=#{ token }"

    expect(page).to have_text('Daily survey January 14, 2014')

    click_button 'Submit'

    expect(page).to have_text('Thank you for responding to the survey')
    expect(page).to have_text('Day 14 survey January 14, 2014')
  end
end
