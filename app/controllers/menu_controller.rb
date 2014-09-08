class MenuController < ApplicationController
  def index
  end

  def show
    @food = @listing.foods.select{|food| food.id == params[:id].to_i }[0]
  end
end