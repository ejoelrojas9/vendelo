class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include Language
  include Pagy::Backend

  # class NotAutohrizedError < StandardError; end   # Logica movida al authorization.rb

  # rescue_from NotAutohrizedError do
  #   redirect_to products_path, alert: t('common.not_authorized')   # Se ejecuta redirec cuando no es is_allowed 
  # end
  
  # around_action :switch_locale      # Logica movida al language.rb
  # before_action :set_current_user   # Logica movida al authentication.rb
  # before_action :protect_pages      # Logica movida al authentication.rb

  # def switch_locale(&action)        # Logica movida al language.rb
  #   I18n.with_locale(locale_from_header, &action)
  # end

  # private

  # def locale_from_header            # Logica movida al language.rb
  #   request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
    
  # end

  # def set_current_user    # Logica movida al authentication.rb
  #   Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  # end

  # def protect_pages   # Logica movida al authentication.rb
  #   redirect_to new_session_path, alert: t('common.not_logged_in') unless Current.user    # Si no hay usuario logueado redirecciona a new_session_path
  # end

  # def authorize! record = nil   # Logica movida al authorization.rb
  #   is_allowed = "#{controller_name.singularize}Policy".classify.constantize.new(record).send(action_name)
  #   raise NotAutohrizedError unless is_allowed    # raise hace una excecpción del nuevo error cuando no este permitido
  # end
end

# "#{product_name.singularize}Policy".classify.constantize  => Crea la clase de manera dinamica, classify convierte el string en clase y constantize lo convierte en camel case
# .new(record) => new crea la instancia
# .send(action_name)  => Invoca el metodo que corresponde con la acción que se este ejecutando
