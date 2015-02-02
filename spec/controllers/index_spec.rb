require 'factory_girl'
require './spec/factories'

feature 'User sees' do

  

end

feature 'User can click to see' do

  scenario 'sign-up options', js: true do
    visit '/'

    click_button 'Join Chitter'

    expect(page).to have_css('#signupform')
  end





end
