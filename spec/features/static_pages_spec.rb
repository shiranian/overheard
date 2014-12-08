require 'rails_helper'

feature "home page" do
  scenario "user logs in and is redirected to moods#new" do
    user = create(:user)
    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    expect(current_path).to eq('/')
  end

  scenario "user chooses mood" do
            
  end
end
