Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
