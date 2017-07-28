require 'rails_helper'

RSpec.feature "SignIn", type: :feature do
  let(:account) { create(:account) }
  scenario do
    visit '/login'
    fill_in 'session_email', with: account.email
    fill_in 'session_password', with: 'password'
    click_on "login"

    expect(page).to have_text('Login success!')
  end
end
