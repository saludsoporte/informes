class CreateClues < ActiveRecord::Migration[6.1]
  def change
    create_table :clues do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
