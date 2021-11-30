class CreateDatos < ActiveRecord::Migration[6.1]
  def change
    create_table :datos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
