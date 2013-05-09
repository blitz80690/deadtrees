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

  get '/register' do
    slim :'user/register', :layout => true
  end

  post '/register' do
    # error on duplicate email
    if User.where(:email => params[:email]).count > 0
      flash[:error] = "This email address is already registered."
      redirect to '/register'
    end
    # error on duplicate username
    if User.where(:username => params[:username]).count > 0
      flash[:error] = "This username is already registered."
      redirect to '/register'
    end

    user = User.new
    user.name = params[:name]
    user.username = params[:username]
    user.email = params[:email]
    user.password = params[:password]
    user.save

    flash[:success] = "You have been successfully registered."
    redirect to '/login'
  end
end
