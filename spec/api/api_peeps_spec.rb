describe 'Peeps API' do

  it 'is returned as JSON object' do
    john    = create(:a_user, name: "John")
    peep    = create(:a_peep, text: "Hello, World!", user: john)

    get "http://localhost:9292/api/peeps/" + peep.id.to_s

    expect_json({text: "Hello, World!", author: "John"})
  end
end