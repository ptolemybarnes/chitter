feature 'user posts a peep' do

  scenario 'when user is logged in' do
    oz_the_user = create(:oz_the_user)
    signin_as oz_the_user

    visit '/peep/new'
    fill_in 'text', with: 'Hello, World'
    click_button "Peep away!"

    expect(page).to have_content('Hello, World')
    expect(page).to have_content('peeped by Oz')
  end
end

def signin_as user
  visit '/user/signin'

  fill_in 'name'                 , with: user.name
  fill_in 'password'             , with: user.password
  click_button 'Login'
end