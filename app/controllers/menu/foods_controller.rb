class Menu::FoodsController < ApplicationController
  def show
    @food = @listing.foods.select{|food| food.id == params[:id].to_i }[0]
  end
end