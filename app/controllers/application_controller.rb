class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :get_locale
  

  private

  # def get_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end
  
  def get_locale
    I18n.locale = session[:i18n] || I18n.default_locale || :en
  end

end

