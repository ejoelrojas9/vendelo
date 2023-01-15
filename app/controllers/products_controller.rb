class ProductsController < ApplicationController 

  def index
    @products = Product.all.with_attached_photo.order(created_at: :desc)
  end

  def show
    product
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)  
    if @product.save
      redirect_to products_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end  
    #pp @product  ## pp muestra por pantalla el contenido de una variable
  end

  def edit
    product
  end

  def update
    if product.update(product_params)
      redirect_to product_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    product.destroy
    redirect_to products_path, notice: t('.destroyed'), status: :see_other
  end
  
  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :photo, :category_id)
  end

  def product
    @product = Product.find params[:id]
  end

end


 #Modelo -> consultas, validaciones, relación

  #Vista -> devolder al usuario html, pdf, csv, json
  #Controlador -> lógica

  #Index es para devolver un conunto de cosas, en este caso un conjunto de productos