class CreateRelacionArticulos < ActiveRecord::Migration[6.1]
  def change
    create_table :relacion_articulos do |t|
      t.references :articulo, null: false, foreign_key: true
      t.references :herramienta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
