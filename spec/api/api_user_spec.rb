describe 'User API' do

  describe 'returns JSON' do

    it 'which includes user information' do
      user = create(:a_user, name: "Oz")
      
      get 'http://localhost.com:9292/api/users/Oz'

      expect_json({:name => "Oz", :email => "Oz@email.com"})
    end

    it 'which includes links to users peeps' do
      bernard = create(:a_user, name: 'Bernard')
      peep    = create(:a_peep, user: bernard, text: "Hello, World!")

      get 'http://localhost.com:9292/api/users/Bernard'

      expect_json({peeps: ["http://localhost:9292/api/peeps/" + peep.id.to_s]})
    end

    it 'which contains error message if user does not exist' do
      get 'http://localhost.com:9292/api/users/Patrick'

      expect_json({error: "Patrick is not a Chitterer!"})
    end

  end

  describe 'takes requests' do

    it 'and creates new user' do
      tom_the_user_info = {name: "Tom", email: "tom@gmail.com", password: "secret", password_confirmation: "secret"}

      post 'http://localhost.com:9292/api/users/new', tom_the_user_info

      expect(User.first( name: "Tom")).to_not eq(nil)
    end

    it 'and returns error message if passwords do not match' do
      tom_the_user = {name: "Tom", email: "tom@gmail.com", password: "secret", password_confirmation: "mistake"}

      post 'http://localhost.com:9292/api/users/new', tom_the_user

      expect_json({error: "The passwords did not match"})
    end
  end
end