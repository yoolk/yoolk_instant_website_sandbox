class ProductsController < ApplicationController
  def index
  end

  def show
    @product = @listing.products.first
  end
end