class AddDatosUnidad < ActiveRecord::Migration[6.1]
  def change
    add_column :unidads, :clues, :string
    add_column :unidads, :domicilio, :text
    add_column :unidads, :telefono, :string, :limit => 10
    add_reference :unidads, :tipo_unidad, :null => true, :index => true
    add_foreign_key :unidads, :tipo_unidads
    add_reference :unidads, :entidad, :null => true, :index => true
    add_foreign_key :unidads, :entidads
  end
end
