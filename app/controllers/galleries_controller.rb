class GalleriesController < ApplicationController
  def index
  end

  def show
    @gallery = @listing.image_galleries.find { |gallery| gallery.id == params[:id].to_i }
  end
end