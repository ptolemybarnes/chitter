require 'sinatra/base'
require 'slim'
require 'data_mapper'

require_relative './data_mapper_setup'
require_relative './views/init'

class Chitter < Sinatra::Base
  set :root, File.dirname(__FILE__) # sets app/. as the default route.
  set :public_dir, Proc.new{File.join(root, '..', "public")}
  set :public_folder, 'public'

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