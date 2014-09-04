class ProductsController < ApplicationController
  def index
  end

  def show
    @product = @listing.products.select{|pro| pro.id.eql? params[:id].to_i}[0]
  end
end