class CreatePartidas < ActiveRecord::Migration[6.1]
  def change
    create_table :partidas do |t|
      t.integer :partida
      t.float :indice
      t.integer :cog2011
      t.text :descripcion
      t.text :descripcion2

      t.timestamps
    end
  end
end
