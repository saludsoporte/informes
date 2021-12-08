class DelRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :rol_id, :bigint    
    remove_column :perfils, :nombre, :string
    add_reference :users, :personal, :null => true,index:true
    add_reference :perfils , :rol,index:true
    add_reference :perfils , :user,index:true
    add_foreign_key :users, :personals
    add_foreign_key :perfils, :rols
    add_foreign_key :perfils, :users

  end
end