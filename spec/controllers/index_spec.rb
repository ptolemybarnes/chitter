require 'factory_girl'
require './spec/factories'

feature 'User doesnt see', js: true do

  scenario 'sign-up options' do
    visit '/'

    expect(page).to_not have_content('Password Confirmation')
  end

  scenario 'sign-up options after signing in' do
    user = User.create(name: "Oz", password: "secret")
    visit '/'

    fill_in 'name',     with: "Oz"
    fill_in 'password', with: "secret"
    click_button 'login'

    expect(page).to_not have_button('Join Chitter')
    expect(page).to_not have_css('#signinform')
  end
end

feature 'User can click to see' do

  scenario 'sign-up options', js: true do
    visit '/'

    click_button 'Join Chitter'

    expect(page).to have_css('#signupform')
  end

end
