class CreateRelacionDatos < ActiveRecord::Migration[6.1]
  def change
    create_table :relacion_datos do |t|
      t.references :herramienta, null: false, foreign_key: true
      t.references :dato, null: false, foreign_key: true
      t.text :valo

      t.timestamps
    end
  end
end
