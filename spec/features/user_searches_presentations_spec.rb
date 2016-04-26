require 'rails_helper'

feature 'User searches for a presentation' do
  let!(:meetup1) { FactoryGirl.create(:presentation, title: "Public Speaking") }
  let!(:meetup2) { FactoryGirl.create(:presentation, title: "Being Awesome") }
  let!(:meetup3) { FactoryGirl.create(:presentation, title: "Mastering Ruby") }

  scenario 'User searches successfully' do
    visit presentations_path

    fill_in 'search', with: "Being"
    click_button 'Search'

    expect(page).to have_content meetup2.title
  end

  scenario 'User searches lowercase' do
    visit presentations_path

    fill_in 'search', with: "public"
    click_button 'Search'

    expect(page).to have_content meetup1.title
    expect(page).to_not have_content meetup2.title
  end

  scenario 'User searches blank field' do
    visit presentations_path

    fill_in 'search', with: ""
    click_button 'Search'

    expect(page).to have_content meetup1.title
    expect(page).to have_content meetup2.title
    expect(page).to have_content meetup3.title
  end
end
