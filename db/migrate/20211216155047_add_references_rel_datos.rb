class AddReferencesRelDatos < ActiveRecord::Migration[6.1]
  def change
    remove_column :relacion_herramienta, :herramienta_id, :bigint
    add_reference :relacion_herramienta, :herramientum, :null => true,index:true
    add_foreign_key :relacion_herramienta, :herramienta
    
    remove_column :relacion_datos, :herramienta_id, :bigint
    add_reference :relacion_datos, :herramientum, :null => true,index:true
    add_foreign_key :relacion_datos, :herramienta
    add_reference :relacion_datos, :informe_general, :null => true,index:true
    add_foreign_key :relacion_datos, :informe_generals
  end
end
