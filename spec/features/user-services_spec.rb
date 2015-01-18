feature 'user signs up' do

  scenario "when a new user visits the site" do
    visit '/user/signup'
    fill_in 'name'                 , with: 'Jeff'
    fill_in 'email'                , with: 'pachu@kitchu.com'
    fill_in 'password'             , with: 'password'
    fill_in 'password_confirmation', with: 'password'

    click_button 'Join Chitter'

    expect(page).to have_content("Jeff, you are now a Chitterer!")
  end
end