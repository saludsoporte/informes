class AddTipoInforme < ActiveRecord::Migration[6.1]
  def change
    add_column :informe_generals, :tipo_informe, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
