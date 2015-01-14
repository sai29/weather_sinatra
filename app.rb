require 'sinatra'
require "barometer"
get '/' do
  erb :home
end

get '/:city' do
  @city = params[:city]
  barometer = Barometer.new @city
  @weather = barometer.measure
  erb :weather
end

not_found do
  halt 404, 'page not found'
end