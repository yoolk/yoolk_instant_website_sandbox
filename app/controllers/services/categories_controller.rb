class Services::CategoriesController < ApplicationController
  def show
    @service_category = @listing.service_categories.select{|category| category.alias_id == params[:category_id]}[0]
  end
end