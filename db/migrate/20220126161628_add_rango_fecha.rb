class AddRangoFecha < ActiveRecord::Migration[6.1]
  def change
    add_column :informe_ctrl_docums, :fecha_ini, :date
    add_column :informe_ctrl_docums, :fecha_fin, :date
    add_column :informe_ctrl_docums, :rango, :boolean, default:false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
