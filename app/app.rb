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

  get '/peep/new' do
    slim :"peep/new"
  end

  post '/peep/new' do
    "Hello, World!"
  end

  get '/user/signin' do
    slim :"user/signin"
  end

  post '/user/signin' do
    user = User.signin(params)
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
end