
set :server, 'thin'
set :environment, :development
require './app.rb'
run Sinatra::Application.run!