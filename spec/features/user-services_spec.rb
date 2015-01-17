require 'spec_helper'
require 'rspec'
require 'capybara/rspec'

feature 'user signs up' do

  scenario "when a new user visits the site" do
    visit '/user/signup'

    fill_in 'name' , with: 'Jeff'
    fill_in 'email', with: 'pachu@kitchu.com'
    click_button 'Join Chitter'

    expect(page).to have_content("Jeff, you are now a Chitterer!")
  end
end