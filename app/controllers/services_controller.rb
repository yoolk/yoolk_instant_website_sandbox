class ServicesController < ApplicationController
  def index
  end

  def show
    @service = @listing.services.select{|service| service.id == params[:id].to_i }[0]
  end
end