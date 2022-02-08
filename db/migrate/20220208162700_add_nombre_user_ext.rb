class AddNombreUserExt < ActiveRecord::Migration[6.1]
  def change
    add_column :tabla_user_ids, :nombre_user, :string
  end
end
