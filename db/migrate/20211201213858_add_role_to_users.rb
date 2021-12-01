class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :rol, foreign_key: true
  end
end
