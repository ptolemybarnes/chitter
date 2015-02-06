require 'factory_girl'
require_relative '../factories'

feature 'Peeps can be viewed', js: true do

  scenario 'on the homepage' do
    create(:a_peep, text: 'This is the first peep')
    visit '/'

    expect(page).to have_content('This is the first peep')
  end
end