require 'rails_helper'

# As a presenter
#   I want to edit my talk
#   So that people see the correct information
#
#   Acceptance Criteria -
#   [ ] On the talk edit page, I should see fields for title, slides and description.
#   [ ] Clicking on the "upload slides" button should bring up a prompt for uploads.
#   [ ] If I did not fill out the information correctly, I will be presented with an error message.
#   [ ] If I save my changes, I should be brought back to my talk show page.
#   [ ] Admins and the creator's of the lighting talk may delete the lightning talk if they wish. Only the user can edit the lighting talk.

feature "creator edits presentation data" do
  let(:user) do
    FactoryGirl.create(:user)
  end
  let(:user2) do
    FactoryGirl.create(:user)
  end

  let!(:presentation) { FactoryGirl.create(:presentation, user: user) }

  scenario "creator of presentation edits presentation" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    click_link presentation.title

    click_link "Edit Presentation"

    fill_in 'Title', with: "What Even Is CSS?"
    fill_in 'Description', with: "AAAAAHHHHHHHH"
    fill_in 'Video URL', with: "https://www.youtube.com/watch?v=Bi3VR_TWIoM"

    click_button "Submit"

    expect(page).to have_content "What Even Is CSS?"
    expect(page).to have_content "AAAAAHHHHHHHH"
  end

  scenario "not-creator tries to edit presentation" do

    visit 'users/sign_in'
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"

    visit presentations_path(presentation)

    expect(page).to_not have_content "Edit"
  end
end
