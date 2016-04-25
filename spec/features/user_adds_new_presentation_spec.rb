require "rails_helper"

feature "user creates new lighting talk" do
  let(:user) do
    FactoryGirl.create(:user)
  end

  scenario "visitor adds new presentation successfully" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit new_presentation_path
    expect(page).to have_content "New Presentation Form"

    fill_in 'Title', with: "How to Win Friends and Influence People"
    fill_in 'Description', with: "The best public speaking presentation"
    fill_in 'Video URL', with: "https://www.youtube.com/watch?v=Bi3VR_TWIoM"

    click_button "Add Presentation"

    expect(page).to have_content "Presentation added successfully"
    expect(page).to have_content "How to Win Friends and Influence People"
    expect(page).to have_content "The best public speaking presentation"
    expect(page).to have_selector(".embed-container")
  end

  scenario "user does not provide proper information for a presentation" do
    visit new_presentation_path

    click_button "Add Presentation"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
