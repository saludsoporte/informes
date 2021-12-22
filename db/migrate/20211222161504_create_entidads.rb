class CreateEntidads < ActiveRecord::Migration[6.1]
  def change
    create_table :entidads do |t|
      t.string :nombre
      t.string :abreviatura

      t.timestamps
    end
  end
end
