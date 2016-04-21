require 'rails_helper'

feature "visitor sees a list of presentations" do
  scenario "sees a list of cities and link for new city" do
    presentation = FactoryGirl.create(:presentation)
    visit presentations_path

    expect(page).to have_content presentation.title
  end
end
