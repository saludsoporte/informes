Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  resources :rols
  devise_for :users
  resources :departamentos
  resources :direccions
  resources :subdireccions
  resources :areas
  root "informe_generals#index"

  resources :relacion_herramienta
  resources :informe_generals
  resources :relacion_datos
  resources :relacion_articulos
  resources :plantillas
  resources :herramienta
  resources :perfils
  resources :datos
  resources :conexion_bds
  resources :clues
  resources :unidads
  resources :articulos
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
