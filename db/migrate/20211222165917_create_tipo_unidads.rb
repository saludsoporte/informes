class CreateTipoUnidads < ActiveRecord::Migration[6.1]
  def change
    create_table :tipo_unidads do |t|
      t.string :abreviatura
      t.string :nombre

      t.timestamps
    end
  end
end
