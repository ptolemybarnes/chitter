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
    simon = build_stubbed(:a_user, name: "Simon")
    create(:a_peep, text: "Colorless green ideas sleep furiously.", user: simon)

    visit '/'

    expect(page).to have_content("Colorless green ideas sleep furiously.")
    expect(page).to have_content("by Simon")
  end

  scenario 'in chronological order' do
    create(:a_peep, text: first  = "I am the alpha.")
    create(:a_peep, text: second = "I am the omega.")

    visit '/'

    expect(page.all('.peeps').map(&:text)).to eq([first, second])
  end
end