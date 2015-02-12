class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_domain
  before_action :set_listing
  before_action :set_locale
  before_action :set_account
  before_action :set_request
  before_action :set_i18n
  theme         :theme_resolver
  before_action :set_template
  before_action :set_theme_color_url

  def current_listing
    @listing
  end

  def theme_color_url
    @theme_color_url
  end

  protected

    def seo
      class_name = "yoolk/seo/#{controller_path}/#{action_name}".classify
      obj =   [@announcement,
              @product, @product_category,
              @service, @service_category,
              @food, @food_category,
              @gallery].compact

      class_name.constantize.new(@listing, obj.first)
    end

    def default_url_options
      { theme: request.parameters['theme'], color: request.parameters['color'], alias_id: params[:alias_id], locale: params[:locale] }
    end

    def extract_alias_id(text)
      text  = text.to_s.dup.force_encoding('ISO-8859-1')
      match = /^([A-Za-z]+-)?[A-Za-z]+\d+/.match(text)
      if match.present?
        match[0]
      else
        text
      end
    end

  private

    def set_domain
      @current_domain = Yoolk::Sandbox::InstantWebsite::Domain.find(request.host)
    end

    def set_listing
      @listing = Yoolk::Sandbox::Listing.find(params[:alias_id]) || @current_domain.try(:listing)

      render file: "#{::Rails.root}/public/404.html", status: 404 and return if @listing.nil?
    end

    def set_locale
      locale = (params[:locale].presence || @listing.locale).to_sym

      ::I18n.locale = locale
    end

    def set_account
      @current_account = Yoolk::Sandbox::Account.find(params[:login])
    end

    def set_request
      @request = Yoolk::Liquid::RequestDrop.new
    end

    def set_i18n
      @i18n = Yoolk::Liquid::I18nDrop.new
    end

    def set_theme_color_url
      params[:color] =  params[:color].presence ||
                        current_listing.instant_website.color_name.presence ||
                        current_listing.instant_website.template.colors.first.try(:name)

      @theme_color_url = if params[:color].present?
        "#{params[:theme]}/all_#{params[:color]}"
      else
        "#{params[:theme]}/all"
      end
    end

    def theme_resolver
      params[:theme] ||= (params[:theme].presence || 'sample')
    end

    def set_template
      @current_template = Yoolk::Sandbox::InstantWebsite::Template.find(params[:theme])
    end

    def content_for_header
      Yoolk::Liquid::ContentHeader.new(@listing, view_context, seo).to_s
    end

    def liquid_assigns
      view_assigns.merge('content_for_header' => content_for_header)
    end
end