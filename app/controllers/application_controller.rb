class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include Language
  include Pagy::Backend

rescue_from ActiveRecord::RecordNotFound do
  redirect_to products_path, alert: "User no found"
end

end