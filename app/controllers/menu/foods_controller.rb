class Menu::FoodsController < ApplicationController
  def show
    @food = @listing.foods.find { |food| food.id == params[:id].to_i }
    if params[:category_id]
      @food_category = @listing.food_categories.find { |category| category.id == params[:category_id].to_i }

      if @food_category.nil?
        redirect_to menu_food_path(@food)
      end
    end
  end
end