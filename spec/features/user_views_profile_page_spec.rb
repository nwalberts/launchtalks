require 'rails_helper'

feature "user may view their profile information" do
  let(:user) do
    FactoryGirl.create(:user)
  end

  scenario "user successfully views profile info" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit '/'
    click_link "View Profile"

    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
    expect(page).to have_content user.email
    expect(page).to have_content "Edit Account Info"
  end

  scenario "user tries to view profile without being signed in" do
    visit '/'

    expect(page).to_not have_content "View Profile"
  end
end
