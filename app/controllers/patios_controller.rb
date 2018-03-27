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
      puts JSON.pretty_generate(@google_data)
    end

    def set_weather_data
      @weather_datum = WeatherDatum.last
    end
end
