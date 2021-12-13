class AddReferenceToHerramientas < ActiveRecord::Migration[6.1]
  def change
    remove_column :herramienta, :dato_id, :bigint
    add_column :herramienta, :nombre_sistema, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #add_reference :herramienta, :plantilla, :null => true,index:true
    #add_reference :herramienta, :articulo, :null => true, index:true
    #add_foreign_key :herramienta, :plantilla
    #add_foreign_key :herramienta, :articulo
  end
end
