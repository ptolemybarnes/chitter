require 'factory_girl'
require './spec/factories'

describe Peep, '.create' do

  it 'creates peep with a message' do
    peep = Peep.create(text: "Hello, World!", user: build_stubbed(:a_user))

    expect(peep.text).to eq("Hello, World!")
    expect(peep.saved?).to eq(true)
  end

  it 'creates peep with an author' do
    oz_the_user = build_stubbed(:a_user, name: "Oz")

    peep = Peep.create(text:"Hello, World", user: oz_the_user)

    expect(peep.user_id).to eq(oz_the_user.id)
  end

  it 'creates peep with a time of its creation' do
    peep = create(:a_peep)
    time = peep.peeped_at
    
    expect(peep.peeped_at).to eq time
  end

  it 'does not save a peep that is an empty string' do
    peep = Peep.create(text:"", user: build_stubbed(:a_user))

    expect(peep.saved?).to eq(false)
  end

  it 'does not save a peep that is too long' do
    long_peep = ("I love repetition" * 10)
    
    peep = Peep.create(text: long_peep, user: build_stubbed(:a_user))

    expect(peep.saved?).to eq false
  end
end