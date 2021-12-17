class CreateRelacionEntradaUnidads < ActiveRecord::Migration[6.1]
  def change
    create_table :relacion_entrada_unidads do |t|
      t.references :informe_general, null: false, foreign_key: true
      t.references :unidad, null: false, foreign_key: true
      t.string :caducado
      t.string :necesita
      t.string :por_caducar
      t.string :existencia_fisica
      t.string :buen_estado
      t.string :extra

      t.timestamps
    end
  end
end
