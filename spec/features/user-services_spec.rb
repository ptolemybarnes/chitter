feature 'User can sign in' do

  scenario "and see a greeting message with her name", js: true do
    user = User.create(name: "Oz", password: "secret")
    visit '/'

    fill_in 'name', with: "Oz"
    fill_in 'password', with: "secret"
    click_button 'login'

    expect(page).to have_content('Welcome back Oz!')
  end

end

# feature 'New user can sign up' do
#     click_button 'sign-up'




# end