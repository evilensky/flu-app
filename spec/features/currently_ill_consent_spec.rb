require 'spec_helper'

feature 'Currently ill consent' do
  scenario 'is submitted' do
    visit '/currently_ill_consents/new'
    fill_in 'currently_ill_consent_email', with: 'foo@example.com'
    click_button 'Submit Consent'

    expect(page).to have_text('Thank you')
  end
end
