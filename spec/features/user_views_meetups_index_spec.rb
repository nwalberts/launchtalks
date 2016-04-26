
require 'rails_helper'

feature "visitor sees list of meetups" do
  let!(:user) { FactoryGirl.create(:user) }
  scenario "visits meetup index and sees list of meetups" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit meetups_path

    expect(page).to have_selector('li')
    expect(page).to have_content "Meetups in Boston"
    expect(page).to have_link "View Profile"
    expect(page).to have_link "LaunchTalks"
    expect(page).to have_link "Log Out"
  end
end
