require 'rails_helper'

feature "user can add new presentation" do
  let(:user) do
    User.create(
      first_name: "Greg",
      last_name: "Ward",
      email: "greg@la.com",
      password: "password1"
      )
  end

  scenario "visitor adds new presentation successfully" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    click_link "Create New Presentation"
    expect(page).to have_content "New Presentation Form"

    fill_in 'Title', with: "How to Tame a Lion"
    fill_in 'Description', with: "Do try this at the zoo folks!"

    click_button "Add Presentation"

    expect(page).to have_content "Presentation added successfully"
    expect(page).to have_content "How to Tame a Lion"
    expect(page).to have_content "Do try this at the zoo folks!"
  end

  scenario "visitor does not provide proper information for a presentation" do
    visit new_presentation_path

    click_button "Add Presentation"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
