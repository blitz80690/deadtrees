require 'sinatra/flash'

require_relative '../models/user.rb'

# Handle all user related requests.
class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/login' do
    slim :'user/login', :layout => true
  end

  post '/login' do
    user = User.where(:username => params[:username]).first
    if user
      if user.authenticate(params[:password])
        session[:uid] = user.id
        redirect to('/ping')
      end
    end

    flash.now[:error] = "The username or password is incorrect."

    slim :'user/login', :layout => true
  end

  get '/logout' do
    flash[:success] = "You have been logged out."
    session[:uid] = nil
    redirect to('/login')
  end
end
