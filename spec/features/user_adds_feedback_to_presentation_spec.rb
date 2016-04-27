require 'rails_helper'

feature "user adds new comment to presentation" do
  let!(:comment) { FactoryGirl.create(:comment) }

  scenario "user adds comment" do
    visit 'users/sign_in'
    fill_in "Email", with: comment.user.email
    fill_in "Password", with: comment.user.password
    click_button "Log in"

    visit presentations_path
    click_link comment.presentation.title

    click_link "Add a Comment"
    fill_in "Body", with: "Beautiful!"
    click_button "Submit"

    expect(page).to have_content("Comment added successfully!")
    expect(page).to have_content("Beautiful!")
  end

  scenario "user fails to comment without a body" do
    visit 'users/sign_in'
    fill_in "Email", with: comment.user.email
    fill_in "Password", with: comment.user.password
    click_button "Log in"

    visit presentations_path
    click_link comment.presentation.title

    click_link "Add a Comment"
    click_button "Submit"

    expect(page).to have_content("Comment must have body.")
    expect(page).to_not have_content("Comment added successfully!")
  end
end
