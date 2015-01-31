require 'factory_girl'
require './spec/factories'

describe 'User information' do

  it 'is returned as json object' do
    user = create(:a_user, name: "Oz")
    
    get 'http://localhost.com:9292/api/users/Oz'

    expect_json({:name => "Oz", :email => "Oz@email.com"})
  end

end