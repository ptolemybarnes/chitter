feature 'user posts a peep' do

  scenario 'when a user visits the site' do
    visit '/peep/new'

    fill_in 'peep', with: 'Hello, World'

    click_button "Peep away!"

    expect(page).to have_content('Hello, World')
  end
end