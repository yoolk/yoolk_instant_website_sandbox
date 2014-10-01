class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_listing
  before_action :set_content_for_header
  theme         :theme_resolver

  protected

    def default_url_options
      { theme: request.parameters['theme'], alias_id: params[:alias_id], locale: params[:locale] }
    end

    def extract_alias_id(text)
      text  = text.to_s.dup.force_encoding("ISO-8859-1")
      match = /^([A-Za-z]+-)?[A-Za-z]+\d+/.match(text)
      if match.present?
        match[0]
      else
        text
      end
    end

  private

    def set_listing
      @listing = Yoolk::Sandbox::Listing.find(params[:alias_id] || 'kh1')
    end

    def set_content_for_header
      @content_for_header = Yoolk::Liquid::ContentHeader.new(@listing, view_context).to_s
    end

    def theme_resolver
      @current_theme ||= (params[:theme] || 'sample')
    end
end