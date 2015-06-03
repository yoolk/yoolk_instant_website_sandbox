class ProductsController < ApplicationController
  def index
  end

  def show
    @product = product
  end

  def show_category
    @show_category = product
    render action: "show"
  end

  private

  def product
    @product ||= @listing.products.find { |product| product.id == params[:id].to_i }
  end
end