class MenuController < ApplicationController
  def index
    @listing = Yoolk::Listing.find(1)
  end
end