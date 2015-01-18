require 'sinatra/base'
require 'slim'
require 'data_mapper'
require 'bcrypt'
require 'byebug'

require_relative './data_mapper_setup'

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
    puts "HELLO!"
    if User.signup(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])      
      "#{params[:name]}, you are now a Chitterer!"
    end
  end

end