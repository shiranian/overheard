require 'rails_helper'

feature "home page" do
   before(:each) do
     build_user_and_sign_in
   end
  
  scenario "user logs in and is redirected to moods#new" do
    expect(current_path).to eq('/')
    expect(page).to have_content("Curious Core")
  end

  scenario "user chooses mood" do
    click_link("Curious Core")
    expect(current_path).to eq(set_sessions_mood_path)
  end

  def build_user_and_sign_in
    user = build(:user)
    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end
end
