feature 'New user can sign up' do

  scenario "when he or she visits the site" do
    user = User.create(name: "Oz", password: "secret")
    visit '/'

    fill_in 'name', with: "Oz"
    fill_in 'password', with: "secret"

    click_button 'login'
    expect(page).to have_content('You are signed in as a Oz')
  end
end