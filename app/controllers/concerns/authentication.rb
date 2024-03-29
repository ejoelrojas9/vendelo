module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
    before_action :protect_pages
  end

  private

  def set_current_user    # Logica movida al authentication.rb
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def protect_pages   # Logica movida al authentication.rb
    redirect_to new_session_path, alert: t('common.not_logged_in') unless Current.user    # Si no hay usuario logueado redirecciona a new_session_path
  end

end