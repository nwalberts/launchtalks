require 'rails_helper'
# As a an authenticated user
# I want to see my profile page
# So that I can see my profile details and a list of my past talks

# Acceptance Criteria -
# [ ] On the profile show page, I should see my name, email address, bio and profile avatar if I have one
# [ ] I should see a link to edit my name, email bio and profile picture.
# [ ] I should see each of my past lightning talks, and each should be a link to the details of the talk.
# [ ] If I am not signed in, I will not be allowed to see anyones profile page, and be prompted to sign in.

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
