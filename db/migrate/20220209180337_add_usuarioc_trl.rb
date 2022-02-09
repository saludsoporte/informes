class AddUsuariocTrl < ActiveRecord::Migration[6.1]
  def change
    add_column :tabla_user_ids, :usuario, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
