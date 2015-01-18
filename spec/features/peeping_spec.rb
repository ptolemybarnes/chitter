feature 'user posts a peep' do

  scenario 'when user is logged in' do
    oz_the_user = create(:a_user, name: "Oz")
    signin_as oz_the_user

    visit '/peep/new'
    fill_in 'text', with: 'Hello, World'
    click_button "Peep away!"

    expect(page).to have_content('Hello, World')
    expect(page).to have_content('peeped by Oz')
  end
end

feature 'peeps are viewable' do

  scenario 'on the homepage' do
    peep = "Colorless green ideas sleep furiously."
    create(:a_peep, text: peep)

    visit '/'

    expect(page).to have_content(peep)
  end

end

def signin_as user
  visit '/user/signin'

  fill_in 'name'                 , with: user.name
  fill_in 'password'             , with: user.password
  click_button 'Login'
end