describe 'Peeps API' do

  it 'is returned as JSON object' do
    peep    = create(:a_peep, text: "Hello, World!")

    get "http://localhost:9292/api/peeps/" + peep.id.to_s

    expect_json({text: "Hello, World!"})
  end
end