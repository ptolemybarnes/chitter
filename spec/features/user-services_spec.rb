feature 'New user can sign in' do

  it "when he or she visits the site", js: true do
    user = User.create(name: "Oz", password: "secret")
    visit '/'

    fill_in 'name', with: "Oz"
    fill_in 'password', with: "secret"
    click_button 'login'


    expect(page).to have_content('Welcome back Oz!')
  end
end