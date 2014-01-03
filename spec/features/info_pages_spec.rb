require 'spec_helper'

feature 'info pages' do
  scenario 'visit home' do
    visit '/'

    expect(page).to have_text('Learn more and enroll')
  end

  scenario 'visit enroll' do
    visit '/recruitment/enroll'

    expect(page).to have_text("I am currently in a doctor’s office")
  end
end
