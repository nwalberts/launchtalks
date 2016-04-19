require 'rails_helper'

feature "visitor sees a list of cities" do
  scenario "sees a list of cities and link for new city" do
    talk = Presentation.create(title: "The Wonders of Grass", description: "its a bunch of fun")

    visit presentations_path

    expect(page).to have_content talk.title
  end
end
