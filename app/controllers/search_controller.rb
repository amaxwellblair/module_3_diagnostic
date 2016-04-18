class SearchController < ApplicationController
  def index
    @searches = AltFuel.find_by(zip: params[:zip])
  end
end
