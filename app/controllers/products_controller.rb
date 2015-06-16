class ProductsController < ApplicationController
  def index
  end

  def show
    @product ||= @listing.products.find { |product| product.id == params[:id].to_i }
    if params[:category_id]
      @product_category = @product.product_categories.find { |category| category.id == params[:category_id].to_i }

      if @product_category.nil?
        redirect_to product_path(@product)
      end
    end
  end
end