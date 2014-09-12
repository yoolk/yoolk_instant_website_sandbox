class ServicesController < ApplicationController
  def index
  end

  def show
    @service = @listing.services.find { |service| service.id == params[:id].to_i }
  end
end