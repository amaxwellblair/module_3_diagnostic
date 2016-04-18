class SearchController < ApplicationController
  def index
    @searches = Nrel.find_by(zip: params[:zip])
  end
end
