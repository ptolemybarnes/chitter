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

  # API

  get '/api/users/:name' do
    if (user = User.first(:name => params[:name]))
      peeps_url_array = user.peeps.map {|peep| "http://localhost:9292/api/peeps/" + peep.id.to_s }
      
      json :name => user.name, :email => user.email, :peeps => peeps_url_array, error: nil
    else
      json error: "#{params[:name]} is not a Chitterer!"
    end
  end

  post '/api/users/new' do
    unless User.signup(params).saved?
      json error: 'The passwords did not match'
    end
  end

  get'/api/peeps/:id' do
    if (peep = Peep.first(:id => params[:id]))
      json :text => peep.text, peeped_at: peep.peeped_at, id: peep.id, author: peep.user.name
    else
      json error: "The peep requested does not exist"
    end
  end

  post '/api/peeps/new' do
    author = User.first(id: params[:author_id])
    Peep.create(text: params[:text], user: author)
  end



end