Rails.application.routes.draw do
  
  resources :relacion_entrada_unidads
  resources :partidas
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  get "plantillas/cargar_plantilla", to: "plantillas#cargar_plantilla"
  get "informe_generals/cargar_usuarios_h", to: "informe_generals#cargar_usuarios_h"
  
  devise_for :users
  
  root "informe_generals#index"

  resources :relacion_herramienta,
            :personals,
            :informe_generals,
            :relacion_datos,
            :relacion_articulos,
            :plantillas,
            :herramienta,
            :perfils,
            :datos,
            :conexion_bds,
            :clues,
            :unidads,
            :articulos,
            :users,
            :rols,
            :departamentos,
            :direccions,
            :subdireccions,
            :areas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
