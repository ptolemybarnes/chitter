require 'rack/test'

describe 'index page' do
  include Rack::Test::Methods
  def app; Chitter; end

  context 'when visitor is not logged in' do
    
    it 'they see login options' do
      get '/'

      expect(last_response.body).to match /Sign-in:/
    end
  end
end