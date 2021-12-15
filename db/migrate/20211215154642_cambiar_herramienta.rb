class CambiarHerramienta < ActiveRecord::Migration[6.1]
  def change
    remove_column :plantillas, :herramienta_id, :bigint
    add_reference :plantillas, :herramientum, :null => true,index:true
    add_foreign_key :plantillas, :herramienta
  end
end
