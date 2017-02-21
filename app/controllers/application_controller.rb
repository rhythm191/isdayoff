class ApplicationController < ActionController::API

  before_action :set_locale

  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    locale = extract_locale_from_accept_language_header
    I18n.locale = locale if I18n.available_locales.map(&:to_s).include?(locale)
    logger.debug "* Locale set to '#{I18n.locale}'"
  end

  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
