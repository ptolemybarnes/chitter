feature 'User can sign up' do

  scenario "and see a greeting message", js: true do
    visit '/'

    click_button 'Join Chitter'

    within '#signupform' do
      fill_in 'name', with: "Sanda"
      fill_in 'email', with: "sanda@gmail.com"
      fill_in 'password', with: 'secret'
      fill_in 'password_confirmation', with: 'secret'
    end

    expect(page).to have_content('Welcome to Chitter, Sanda!')
  end

end