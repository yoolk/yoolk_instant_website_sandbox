class GalleriesController < ApplicationController
  def index
  end

  def show
    @image_gallery = @listing.image_galleries.select{|album| album.id == params[:id].to_i }[0]
  end
end