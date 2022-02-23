class AddUnidadInformes < ActiveRecord::Migration[6.1]
  def change
    add_column :informe_generals, :unidad_id, :integer
  end
end
