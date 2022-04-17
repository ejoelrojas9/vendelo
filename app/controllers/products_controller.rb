class ProductsController < ApplicationController 
  def index
    @products = Product.all    
  end

  def show
    @product = Product.find(params[:id])
  end
end

 #Modelo -> consultas, validaciones, relación

  #Vista -> devolder al usuario html, pdf, csv, json
  #Controlador -> lógica

  #Index es para devolver un conunto de cosas, en este caso un conjunto de productos