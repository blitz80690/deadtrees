require 'sinatra/base'
require 'dotenv'

# Load the environment
Dotenv.load

class App < Sinatra::Base
  get '/ping' do
    'pong'
  end
end
