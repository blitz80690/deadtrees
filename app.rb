require 'sinatra/base'

class App < Sinatra::Base
  configure do
    set :session_secret, File.read('session.key')
  end

  get '/ping' do
    'pong'
  end
end

require_relative 'app/controllers/user_controller.rb'
