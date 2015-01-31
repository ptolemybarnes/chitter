require 'sinatra/base'
require 'slim'
require 'data_mapper'
require "sinatra/json"

require 'bcrypt'
require 'byebug'

require_relative './data_mapper_setup'
require_relative './helpers/init'

class Chitter < Sinatra::Base
  set :root, File.dirname(__FILE__) # sets app/. as the default route.
  set :public_dir, Proc.new{File.join(root, '..', "public")}
  set :public_folder, 'public'
  helpers Sinatra::JSON

  enable :sessions
  set :session_secret, 'super_secret'

  get '/' do
    slim :index
  end

  get '/api/users/:name' do
    user = User.first(:name => params[:name])
    json :name => user.name, :email => user.email
  end

end