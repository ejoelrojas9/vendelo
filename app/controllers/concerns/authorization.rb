module Authorization
  extend ActiveSupport::Concern

  included do
    class NotAutohrizedError < StandardError; end

    rescue_from NotAutohrizedError do
      redirect_to products_path, alert: t('common.not_authorized')   # Se ejecuta redirec cuando no es is_allowed 
    end
  end

  private

  def authorize! record = nil
    is_allowed = "#{controller_name.singularize}Policy".classify.constantize.new(record).send(action_name)
    raise NotAutohrizedError unless is_allowed    # raise hace una excecpción del nuevo error cuando no este permitido
  end
  
end