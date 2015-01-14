
set :server, 'thin', :development, :production
set :environment, :development
require './app.rb'
run Sinatra::Application.run!