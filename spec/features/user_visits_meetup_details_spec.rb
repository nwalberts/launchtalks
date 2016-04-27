require 'rails_helper'

feature "visitor sees show page for a meetup" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:meetup) { FactoryGirl.create(:meetup) }

  scenario "successfully sees meetup details" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit meetups_path

    click_link meetup.name

    expect(page).to have_content meetup.name
    expect(page).to have_link meetup.name
    expect(page).to have_content meetup.city
    expect(page).to have_content meetup.state
    expect(page).to have_content "Best place to hone your public speaking skills!"
  end
end
