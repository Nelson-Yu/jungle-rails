require 'rails_helper'

RSpec.feature "Visitor logs in and redirects to home page", type: :feature, js: true do

  # SETUP
  before :each do 
    @user = User.create!(
      first_name: 'Nelson',
      last_name: 'Yu',
      email: 'jungletest@gmail.com',
      password: 'jungle123',
      password_confirmation: 'jungle123'
    )
  end

  scenario "They successfully logs in and gets redirected to home page" do
    # ACT
    visit login_path
    fill_in 'email', with: 'jungletest@gmail.com'
    fill_in 'password', with: 'jungle123'
    find('.login-container').click_on 'Login'

    # VERIFY & DEBUG
    expect(page).to have_content('jungletest@gmail.com')
    save_screenshot
  end

end
