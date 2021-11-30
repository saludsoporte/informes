class CreatePerfils < ActiveRecord::Migration[6.1]
  def change
    create_table :perfils do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
