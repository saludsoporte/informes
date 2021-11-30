class CreatePlantillas < ActiveRecord::Migration[6.1]
  def change
    create_table :plantillas do |t|
      t.references :herramienta, null: false, foreign_key: true
      t.references :dato, null: false, foreign_key: true

      t.timestamps
    end
  end
end
