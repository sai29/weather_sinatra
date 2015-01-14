
set :server, 'webrick'
set :environment, :development
require './app.rb'
run Sinatra::Application.run!