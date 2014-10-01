class Menu::CategoriesController < ApplicationController
  def show
    @food_category = @listing.food_categories.find { |category| category.id == params[:category_id].to_i }
  end
end