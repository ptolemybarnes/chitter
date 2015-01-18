require 'sinatra/base'
require 'slim'
require 'data_mapper'

require 'bcrypt'
require 'byebug'

require_relative './data_mapper_setup'
require_relative './helpers/init'

class Chitter < Sinatra::Base
  set :root, File.dirname(__FILE__) # sets app/. as the default route.
  set :public_dir, Proc.new{File.join(root, '..', "public")}
  set :public_folder, 'public'

  enable :sessions
  set :session_secret, 'super_secret'

  get '/' do
    slim :"peep/view"
  end

  get '/peep/new' do
    redirect to('/user/signin') unless session[:id]
    slim :"peep/new"
  end

  post '/peep/new' do
    user = User.first(id: session[:id])
    peep = Peep.create(params.symbolize_keys.merge(user: user))
    "#{peep.text}, peeped by #{peep.user.name}"
  end

  get '/user/signin' do
    slim :"user/signin"
  end

  post '/user/signin' do
            user = User.authenticate(params)
    session[:id] = user.id

    "Welcome back, #{user.name}!"
  end

  get '/user/signup' do
    slim :"user/signup"
  end

  post '/user/signup' do
    if user = User.signup(params.symbolize_keys)      
      "#{user.name}, you are now a Chitterer!"
    end
  end

  get '/user/signout' do
    user = User.first(id: session[:id])
    session.clear
    "Goodbye, #{user.name}!"
  end

end