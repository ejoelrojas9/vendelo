Rails.application.routes.draw do
  resources :categories
  # resources :categories, except: :show
  resources :products, path: '/'
end
