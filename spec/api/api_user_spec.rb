describe 'User API' do

  describe 'returns JSON' do

    it 'which includes user information' do
      user = create(:a_user, name: "Oz")
      
      get '/api/users/Oz'

      expect_json({:name => "Oz", :email => "Oz@email.com"})
    end

    it 'which includes links to users peeps' do
      bernard = create(:a_user, name: 'Bernard')
      peep    = create(:a_peep, user: bernard, text: "Hello, World!")

      get '/api/users/Bernard'

      expect_json({peeps: ["http://localhost:9292/api/peeps/" + peep.id.to_s]})
    end

    it 'which contains error message if user does not exist' do
      get '/api/users/Patrick'

      expect_json({error: "Patrick is not a Chitterer!"})
    end

  end

  describe 'takes requests' do

    it 'that return authentication confirmation when password is correct' do
      john = create(:a_user, name: "John", password: "secret")

      post '/api/users/authenticate', {name: "John", password: "secret"}

      expect_json({message: 'Welcome back John!'})
    end

    it 'that returns authentication error when password is incorrect' do
      john = create(:a_user, name: "John", password: "secret")

      post '/api/users/authenticate', {name: "John", password: "mistake"}

      expect_json({error: 'Username/password incorrect'})
    end

    it 'to create new user' do
      tom_the_user_info = {name: "Tom", email: "tom@gmail.com", password: "secret", password_confirmation: "secret"}

      post '/api/users', tom_the_user_info

      expect(User.first( name: "Tom")).to_not eq(nil)
    end

    it 'and returns error message if new users passwords do not match' do
      tom_the_user = {name: "Tom", email: "tom@gmail.com", password: "secret", password_confirmation: "mistake"}

      post '/api/users', tom_the_user

      expect_json({error: "The passwords did not match"})
    end
  end
end