class CreateHerramienta < ActiveRecord::Migration[6.1]
  def change
    create_table :herramienta do |t|
      t.references :conexion_bd, null: false, foreign_key: true
      t.references :dato, null: false, foreign_key: true

      t.timestamps
    end
  end
end
