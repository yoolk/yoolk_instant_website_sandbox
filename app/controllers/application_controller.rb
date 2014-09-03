class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_listing
  theme         :theme_resolver

  protected

    def default_url_options
      { theme: request.parameters['theme'], alias_id: params[:alias_id], locale: params[:locale] }
    end

  private

    def set_listing
      @listing = Yoolk::Listing.find(params[:alias_id] || 'kh1')
    end

    def theme_resolver
      @current_theme ||= (params[:theme] || 'business_vcard')
    end
end