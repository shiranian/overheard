require 'rails_helper'

feature "home page" do
  scenario "user visits home page" do
    visit '/'
    expect(page).to have_content("OverHeard")
  end
end