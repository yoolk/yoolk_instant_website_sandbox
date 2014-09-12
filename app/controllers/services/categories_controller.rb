class Services::CategoriesController < ApplicationController
  def show
    @service_category = @listing.service_categories.find { |category| category.alias_id == extract_alias_id(params[:category_id]) }
  end
end