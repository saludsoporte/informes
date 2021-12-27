class AddColunmsInforme < ActiveRecord::Migration[6.1]
  def change
    add_column :informe_generals, :tipo_informacion, :integer
    add_column :informe_generals, :referencia, :integer
    add_column :informe_generals, :memorandum, :integer  
    
  end
end
