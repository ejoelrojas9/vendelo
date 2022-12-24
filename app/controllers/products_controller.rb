class ProductsController < ApplicationController 
  def index
    @products = Product.all    
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)  
    if @product.save
      redirect_to products_path, notice: 'Product created'
    else
      render :new, status: :unprocessable_entity
    end  
    #pp @product  ## pp muestra por pantalla el contenido de una variable
  end
  
  private
  def product_params
    params.require(:product).permit(:title, :description, :price)
  end

end


 #Modelo -> consultas, validaciones, relación

  #Vista -> devolder al usuario html, pdf, csv, json
  #Controlador -> lógica

  #Index es para devolver un conunto de cosas, en este caso un conjunto de productos