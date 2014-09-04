class Products::CategoriesController < ApplicationController
  def show
    @product_category = @listing.product_categories.select { |category| category[:id] == params[:category_id].to_i }[0]
  end
end