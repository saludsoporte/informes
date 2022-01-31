class CreateTablaUserIds < ActiveRecord::Migration[6.1]
  def change
    create_table :tabla_user_ids do |t|
      t.references :user, null: false, foreign_key: true
      t.references :herramientum, null: false, foreign_key: true
      t.string :id_user
      t.string :nombre_herramienta

      t.timestamps
    end
  end
end
