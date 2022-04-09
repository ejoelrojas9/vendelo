Rails.application.routes.draw do
  get '/products', to: 'products#index'  #Index muestra un conjunto de productos
  get '/products/:id', to: 'products#show', as: :product #Show muestra un unico producto en concreto
end
