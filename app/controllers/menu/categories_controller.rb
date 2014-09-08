class Menu::CategoriesController < ApplicationController
  def show
    @menu = @listing.food_categories.select{|category| category.id == params[:category_id].to_i }[0]
  end
end