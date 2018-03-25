require 'net/http'

class PatiosController < ApplicationController
  before_action :set_patio, only: [:show]

  # GET /patios
  def index
    @patios = Patio.all.order(name: :asc)
    set_weather_data
  end

  # GET /patios/1
  def show
    set_google_data
    set_weather_data
  end

  # GET /patios/random
  def random
    @patio = Patio.order("RANDOM()").first
    set_google_data
    set_weather_data
    redirect_to patio_url(@patio)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patio
      @patio = Patio.find(params[:id])
    end

    def set_google_data
      api_uri = URI("https://maps.googleapis.com/maps/api/place/details/json")
      params = {placeid: @patio.google_place_id, key: Rails.application.config.google_api_key}
      api_uri.query = URI.encode_www_form(params)
      response = Net::HTTP.get_response(api_uri)
      @google_data = JSON.parse(response.body)["result"]
    end

    def set_weather_data
      key = Rails.application.config.weather_api_key
      uri = URI("http://api.wunderground.com/api/#{key}/conditions/q/CA/Seattle.json")
      response = Net::HTTP.get_response(uri)
      response = JSON.parse(response.body)['current_observation']
      @weather_data = {weather: response['weather'], temperature: response['temp_f']}
    end
end
