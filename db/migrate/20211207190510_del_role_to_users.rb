class DelRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :rol_id, :bigint    
    add_reference :users, :personal, :null => true
    add_reference :perfils , :rol
    add_reference :perfils , :user
  end
end