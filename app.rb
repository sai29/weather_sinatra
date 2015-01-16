require 'sinatra'

require 'open-uri'
require 'json'
get '/' do
	erb :home
end

get '/:city' do
	city_name = params[:city].chomp.split
	city_name.each do |val|
		val.capitalize!
	end
	city_name = city_name.join("_")
	puts city_name
	wunderground_url_current = 'http://api.wunderground.com/api/31c52a5653ebf884/geolookup/conditions/q/' + city_name + '.json'
	open(wunderground_url_current) do |f|
		json_string = f.read
		json_response = JSON.parse(json_string)
		@city = json_response['location']['city']
		@current_temp = json_response['current_observation']['temp_c']
		@weather = json_response['current_observation']['weather']
		@relative_humidity = json_response['current_observation']['relative_humidity']
	end

	wunderground_url_forecast = 'http://api.wunderground.com/api/31c52a5653ebf884/geolookup/forecast/q/' + city_name + '.json'
	open(wunderground_url_forecast) do |f|
		json_string = f.read
		json_response = JSON.parse(json_string)
		@forecast = json_response['forecast']['simpleforecast']['forecastday']
		@forecast_array = []
		@forecast.each do |var|
			@forecast_array << [var['high']['celsius'],var['low']['celsius']]
		end
	end
	erb :weather
end

