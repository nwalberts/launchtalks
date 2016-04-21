require 'rails_helper'

feature "User edits and deletes profile" do
  let(:imperator) do
    FactoryGirl.create(:user)
  end

  scenario "user updates password on profile" do
    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"

    visit profile_path(imperator.profile)
    click_link "Edit Account Info"
    fill_in "Email", with: imperator.email
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    fill_in "Current password", with: imperator.password

    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end
end
