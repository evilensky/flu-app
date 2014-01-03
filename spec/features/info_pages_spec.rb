require 'spec_helper'

feature 'info pages' do
  scenario 'visit home' do
    visit '/'

    expect(page).to have_text('Learn more and enroll')
  end
end
