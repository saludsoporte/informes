class AddReferencesInformeGeneral < ActiveRecord::Migration[6.1]
  def change
    add_reference :informe_generals, :user, :null => true, index:true
    add_reference :informe_generals, :herramientum, :null => true, index:true
    add_reference :informe_generals, :partida, :null => true, index:true
    add_foreign_key :informe_generals, :users
    add_foreign_key :informe_generals, :herramienta
    add_foreign_key :informe_generals, :partidas
  end
end
