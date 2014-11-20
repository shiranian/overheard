require 'rails_helper'

feature "home page" do
  scenario "user visits home page" do
    user = create(:user)
    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content("I'm Feeling")
  end
end
