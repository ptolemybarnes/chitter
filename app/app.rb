require 'sinatra/base'
require 'slim'

class Chitter < Sinatra::Base

  get '/' do
    "Hello World"
  end

  get '/user/signup' do
    slim :"user/signup"
  end

  post '/user/signup' do
    "Jeff, you are now a Chitterer!"
  end

end