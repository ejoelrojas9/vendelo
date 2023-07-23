class ProductsController < ApplicationController 

  def index
    # pp params[:category_id]
    @categories = Category.order(name: :asc).load_async
    @products = Product.with_attached_photo
    if params[:category_id]
      @products = @products.where(category_id: params[:category_id])
    end
    if params[:min_price].present?
      @products = @products.where( "price>= ?", params[:min_price] )
    end
    if params[:max_price].present?
      @products = @products.where( "price<= ?", params[:max_price] )
    end
    if params[:query_text].present?
      @products = @products.search_full_text(params[:query_text])
    end

    # order_by = {
    #   newest: "created_at DESC",
    #   expensive: "price DESC",
    #   cheapest: "price ASC"
    # }.fetch(params[:order_by]&.to_sym, "created_at DESC")   # & indica si el parametro existe aplica el metodo, en este caso .to_sym

    order_by = Product::ORDER_BY.fetch(params[:order_by]&.to_sym, Product::ORDER_BY[:newest])   # & indica si el parametro existe aplica el metodo, en este caso .to_sym
    @products = @products.order(order_by).load_async
    
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