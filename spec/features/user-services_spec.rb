feature 'User can sign up' do

  scenario "and see a greeting message", js: true do
    visit '/'

    within '#signupform' do
      fill_in 'name', with: "Sanda"
      fill_in 'email', with: "sanda@gmail.com"
      fill_in 'password', with: 'secret'
      fill_in 'password_confirmation', with: 'secret'
      click_button 'submit'
    end

    expect(page).to have_content('Welcome to Chitter, Sanda')
  end

end

feature 'User can signin' do

  scenario "and see a greeting message", js: true do
    visit '/'
    create(:a_user, name: "Thomas", password: 'secret')

    within '#signinform' do
      fill_in 'name', with: "Thomas"
      fill_in 'password', with: 'secret'
      click_button 'submit'
    end
    
    expect(page).to have_content("You are signed in as Thomas")
  end
end