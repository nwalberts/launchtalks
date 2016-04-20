require 'rails_helper'

# As an authenticated user
# I want to sign up for and create a new lightning talk
# So that I that users can see my talk
#
# Acceptance Criteria -
# [ ] On the new talk page, I should see a form to fill in with fields such as the title and description. I should also be able to upload relevant photos or slides.
# [ ] On the new page, I should also be able to upload relevant photos or slides.
# [ ] I should see a link back to the index page
# [ ] Once I click the submit button, I should be brought to the talk's show page.
# [ ] If I am not signed in, I will not be allowed to see the new page, and be prompted to sign in.

feature "user can add new presentation" do
  let(:user) { User.create(first_name: "Greg", last_name: "Ward", email: "greg@la.com", password: "password1") }

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
