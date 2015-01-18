require 'factory_girl'
require './spec/factories'

describe Peep, '.create' do

  it 'creates peep with a message' do
    peep = Peep.create(text: "Hello, World!")

    expect(peep.text).to eq("Hello, World!")
  end

  it 'creates peep with an author' do
    oz_the_user = build_stubbed(:a_user, name: "Oz")

    peep = Peep.create(text:"Hello, World", user: oz_the_user)

    expect(peep.user_id).to eq(oz_the_user.id)
  end
end