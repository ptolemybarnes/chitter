require 'factory_girl'
require './spec/factories'

feature 'User sees' do

  scenario "sign up bar" do
    visit '/'

    expect(page).to have_css('#signup-bar')
  end

  scenario "signin bar" do 
    visit '/'

    expect(page).to have_css('#signin-bar')
  end

end

feature 'Signed in user' do

  # scenario "sees greeting" do
  #   user = User.create(name: "Oz")
    
  # end
end