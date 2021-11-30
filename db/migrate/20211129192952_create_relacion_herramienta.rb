class CreateRelacionHerramienta < ActiveRecord::Migration[6.1]
  def change
    create_table :relacion_herramienta do |t|
      t.references :informe_general, null: false, foreign_key: true
      t.references :herramienta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
