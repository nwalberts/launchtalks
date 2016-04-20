require 'rails_helper'

feature "visitor sees show page for a presentation" do
  let(:user) { FactoryGirl.create(:user) }
  let(:presentation) { FactoryGirl.create(:presentation) }

  scenario "clicks link and is taken to show page for given presentation" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit presentations_path

    click_link presentation.title

    expect(page).to have_content presentation.title
    expect(page).to have_content presentation.description
    expect(page).to have_content presentation.user.first_name
    expect(page).to have_content presentation.user.last_name
  end
end
