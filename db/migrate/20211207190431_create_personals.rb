class CreatePersonals < ActiveRecord::Migration[6.1]
  def change
    create_table :personals do |t|
      t.string :nombre
      t.string :apellido_p
      t.string :apellido_m
      t.string :nombre_completo
      t.string :telefono
      t.string :calle
      t.string :numero
      t.string :colonia
      t.integer :cp
      t.string :curp
      t.date :fecha_nacimiento

      t.timestamps
    end
  end
end
