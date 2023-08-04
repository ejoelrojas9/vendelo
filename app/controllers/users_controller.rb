class UsersController < ApplicationController
  skip_before_action :protect_pages, only: :show

  def show
    user
  end

  private

  def user
    @user = User.find_by!(username: params[:username])    # El signo ! indica una excepción indicando que todo lo que sigue a continuación se va detener
  end
end