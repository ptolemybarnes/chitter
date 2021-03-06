feature 'new user can sign up' do

  scenario "when he or she visits the site" do
    visit '/user/signup'

    fill_in 'name'                 , with: 'Jeff'
    fill_in 'email'                , with: 'pachu@kitchu.com'
    fill_in 'password'             , with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Join Chitter'

    expect(page).to have_content("Jeff, you are now a Chitterer!")
  end
end

feature 'existing user can sign in' do

  scenario 'when he or she visits the site' do
    oz_the_user = create(:a_user, name: "Oz")
    visit '/user/signin'

    fill_in 'name'    , with: "Oz"
    fill_in 'password', with: "secret"
    click_button 'Login'

    expect(page).to have_content('Welcome back, Oz!')
  end
end

feature 'user can sign out' do

  scenario 'after he or she has signed in' do
    user = create(:a_user)
    signin_as user

    visit '/user/signout'

    expect(page).to have_content("Goodbye, #{user.name}!")
  end
end