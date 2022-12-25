Rails.application.routes.draw do
  post '/products', to: 'products#create' #Se encarga de guardas los datos que enviamos desde el formulario
  get '/products/new', to: 'products#new', as: :new_product
  get '/products', to: 'products#index'  #Index muestra un conjunto de productos
  get '/products/:id', to: 'products#show', as: :product #Show muestra un unico producto en concreto  
  get '/products/:id/edit', to: 'products#edit', as: :edit_product #Edit permite editar un producto 
end
