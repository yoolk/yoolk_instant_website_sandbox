class GalleriesController < ApplicationController
  def index
    @galleries = Yoolk::Listing.find(1).galleries
  end
end