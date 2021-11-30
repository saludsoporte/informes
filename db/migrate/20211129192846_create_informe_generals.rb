class CreateInformeGenerals < ActiveRecord::Migration[6.1]
  def change
    create_table :informe_generals do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
