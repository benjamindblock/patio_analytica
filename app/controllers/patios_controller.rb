class PatiosController < ApplicationController
  before_action :set_patio, only: [:show]

  # GET /patios
  def index
    @patios = Patio.all.order(name: :asc)
  end

  # GET /patios/1
  def show
    set_google_data
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
end
