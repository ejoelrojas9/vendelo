class CategoryPolicy < BasePolicy
  def method_missing(m, *args, &block)    # Metodo que se ejecuta cuando no se encuentra el metodo que se llama
    Current.user.admin?
  end

  # def index
  #   Current.user.admin?
  # end

  # def new
  #   Current.user.admin?
  # end

  # def edit
  #   Current.user.admin?
  # end

  # def create
  #   Current.user.admin?
  # end

  # def update
  #   Current.user.admin?
  # end

  # def destroy
  #   Current.user.admin?
  # end
  
end