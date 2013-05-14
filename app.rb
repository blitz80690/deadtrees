$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'sinatra/base'
require 'sequel'
require 'yaml'
require 'slim'

config = YAML.load_file('config/database.yml')['development']
DB = Sequel.connect(config)

class App < Sinatra::Base
  configure do
    set :session_secret, File.read('session.key')
  end

  get '/ping' do
    'pong'
  end
end

require_relative 'app/controllers/user_controller.rb'
require_relative 'app/controllers/isbn.rb'
