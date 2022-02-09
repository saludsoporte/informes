Rails.application.routes.draw do
  
  
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  get "plantillas/cargar_plantilla", to: "plantillas#cargar_plantilla"
  get "informe_generals/cargar_usuarios_h", to: "informe_generals#cargar_usuarios_h"
  get "informe_generals/descargar_archivo", to: "informe_generals#descargar_archivo"
  get "informe_ctrl_docums/descargar_archivo", to: "informe_ctrl_docums#descargar_archivo"
  get "informe_generals/buscar_informe", to: "informe_generals#buscar_informe"
  get "informe_ctrl_docums/buscar_serial", to: "informe_ctrl_docums#buscar_serial"
  get "users/cargar_herramienta", to: "users#cargar_herramienta"
  get "informe_ctrl_docums/listar_documentos", to: "informe_ctrl_docums#listar_documentos"
  devise_for :users
  
  root "informe_generals#index"

  resources :tabla_user_ids,
            :relacion_herramienta,
            :personals,
            :informe_generals,
            :informe_ctrl_docums,
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
            :areas,
            :relacion_entrada_unidads,
            :partidas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
