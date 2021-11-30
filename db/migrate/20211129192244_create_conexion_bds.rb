class CreateConexionBds < ActiveRecord::Migration[6.1]
  def change
    create_table :conexion_bds do |t|
      t.string :nombre_herramienta
      t.string :puerto
      t.string :host
      t.string :usuario
      t.string :password
      t.timestamps
    end
  end
end
