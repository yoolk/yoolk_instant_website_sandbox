class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  theme :theme_resolver

  def default_url_options
    { theme: request.parameters["theme"], locale: params[:locale] }
  end

  private

    def theme_resolver
      @current_theme ||= (params[:theme] || 'sample')
    end
end