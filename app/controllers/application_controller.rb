class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :create_cart

  include SessionsHelper

  before_filter :set_locale

  def default_url_options
    {locale: I18n.locale}
  end

  def function_logged_in_use
    if current_user.nil?
      redirect_to error_path
    end
  end

  def create_cart
    if session[:cart].nil?
      session[:cart] = []
    end
  end

  def check_admin
    if current_user.nil?
      redirect_to root_path
    else
      if !current_user.is_admin?
        redirect_to root_path
      end
    end
  end

  def load_categories
    @categories = Categorie.all
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end
