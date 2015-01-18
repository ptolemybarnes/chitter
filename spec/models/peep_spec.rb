require 'factory_girl'
require './spec/factories'

describe Peep, '.create' do

  it 'with a message' do
    peep = Peep.create(text: "Hello, World!")

    expect(peep.text).to eq("Hello, World!")
  end

  it 'with an author' do
    oz_the_user = build_stubbed(:oz_the_user)

    peep = Peep.create(text:"Hello, World", user: oz_the_user)

    expect(peep.user_id).to eq(oz_the_user.id)
  end
end