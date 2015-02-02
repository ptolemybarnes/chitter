require 'factory_girl'
require './spec/factories'

feature 'User sees', js: true do

  it 'sign up form when opts to join Chitter' do
    visit '/'

    expect(page).not_to have_css('#signupform')

    click_button 'Join Chitter'

    expect(page).to have_css('#signupform')
  end

  it 'sign in form when opts to sign in' do
    visit '/'

    expect(page).not_to have_css('#signinform')

    click_button 'Sign in'

    expect(page).to have_css('#signinform')
  end
  

end
