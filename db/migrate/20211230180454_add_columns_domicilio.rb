class AddColumnsDomicilio < ActiveRecord::Migration[6.1]
  def change
    remove_column :unidads, :domicilio, :text
    add_column :unidads, :calle, :string
    add_column :unidads, :numero_ext, :string
    add_column :unidads, :numero_int, :string
    add_column :unidads, :colonia, :string
    add_column :unidads, :entre_calles_1, :string    
    add_column :unidads, :entre_calles_2, :string    
    add_column :unidads, :codigo_postal, :string    
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
