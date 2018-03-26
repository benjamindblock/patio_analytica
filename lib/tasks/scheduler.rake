desc "This task is called by the Heroku scheduler to update weather data"
task :update_weather => :environment do
  puts "*"*50
  puts ""
  puts "Updating weather....."

  key = Rails.application.config.weather_api_key
  uri = URI("http://api.wunderground.com/api/#{key}/conditions/q/WA/Seattle.json")
  response = Net::HTTP.get_response(uri)
  response = JSON.parse(response.body)['current_observation']

  conditions = response['weather']
  temperature = response['temp_f'].to_f

  if temperature < 40.0
    message = "Brrrrrrrr!! Be sure to wear a puffy jacket in this weather"
  elsif temperature >= 40.0 && temperature < 50.0
    message = "Seems a bit chilly!!"
  elsif temperature >= 50.0 && temperature < 60.0
    message = "Try and sit in the sun at these temps"
  elsif temperature >= 60.0 && temperature < 70.0
    message = "Nice day for a patio!"
  elsif temperature >= 70.0 && temperature < 80.0
    message = "The weather is perfect!"
  elsif temperature >= 80.0 && temperature < 90.0
    message = "Grab a shady spot and relax"
  elsif temperature >= 90.0 && temperature < 100.0
    message = "Get an icy drink!!"
  elsif temperature >= 100.0
    message = "Ooooo it's hot out!"
  else
    message = "Weather is a funny thing...."
  end

  new_weather = WeatherDatum.new(conditions: conditions,
                                 temperature: temperature,
                                 message: message)
  if new_weather.save
    WeatherDatum.where.not(id: new_weather.id).destroy_all
  end

  puts "Temperature: #{temperature}"
  puts "Conditions: #{conditions}"
  puts "Message: #{message}"

  puts ""
  puts "*"*50
  puts "Finished updating weather."
end
