class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  def current_basket
    @current_basket ||= Basket.find_or_create_by(session_token: session[:basket_token] ||= SecureRandom.hex)
  end
  helper_method :current_basket
end
