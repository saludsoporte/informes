class AddTablaUser < ActiveRecord::Migration[6.1]
  def change
    add_column :conexion_bds, :tabla_user, :string
  end
end
