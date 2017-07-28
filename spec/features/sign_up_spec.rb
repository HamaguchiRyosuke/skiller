require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  background do
  end

  scenario do
    visit '/signup'
    fill_in 'Email', with: 'example@sample.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    click_on "signup"
    expect(page).to have_text('Please check your email to activate your account.')
  end
end
