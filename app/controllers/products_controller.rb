class ProductsController < ApplicationController
  def index
  end

  def show
    @product ||= @listing.products.find { |product| product.id == params[:id].to_i }
  end
end