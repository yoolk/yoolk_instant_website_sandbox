class Products::CategoriesController < ApplicationController
  def show
    @product_category = @listing.product_categories.find { |category| category[:id] == params[:category_id].to_i }
  end
end