require 'sinatra/base'

class App < Sinatra::Base
  get '/ping' do
    'pong'
  end
end
