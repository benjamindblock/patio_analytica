class MixesController < ApplicationController
  def index
    @mixes = Mix.all.order(id: :desc)
  end
end
