describe 'Peeps API' do

  it 'returns requested peep as JSON object' do
    john    = create(:a_user, name: "John")
    peep    = create(:a_peep, text: "Hello, World!", user: john)

    get "/api/peeps/" + peep.id.to_s

    expect_json({text: "Hello, World!", author: "John"})
  end

  it 'returns all peep urls in an array' do
    peep1 = '/api/peeps/'+ create(:a_peep, text: "Hello!").id.to_s
    peep2 = '/api/peeps/'+ create(:a_peep, text: "Bonjour!").id.to_s
    peep3 = '/api/peeps/'+ create(:a_peep, text: "Anyonghaseyo!").id.to_s

    get "/api/peeps"

    expect_json(peeps: [peep1, peep2, peep3])
  end

  it 'returns error message if peep does not exist' do
    bad_peep_id = "3827382738278732"
    get "/api/peeps/" + bad_peep_id

    expect_json({error: "The peep requested does not exist"})
  end

  it 'takes requests and creates new peeps' do
    author    = create(:a_user)
    peep_info = {text: "Greetings!", author_id: author.id}

    post "/api/peeps", peep_info

    expect(Peep.first(text: "Greetings!")).to_not eq(nil)
  end
end
