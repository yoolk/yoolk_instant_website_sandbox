class Menu::FoodsController < ApplicationController
  def show
    @food = @listing.foods.find { |food| food.id == params[:id].to_i }
  end
end