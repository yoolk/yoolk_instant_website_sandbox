class LinksController < ApplicationController
  def index
  end

  def show
    @link = @listing.links.find { |link| link.id.to_i == params[:id].to_i }
  end
end