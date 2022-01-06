class CreateInformeCtrlDocums < ActiveRecord::Migration[6.1]
  def change
    create_table :informe_ctrl_docums do |t|
      t.date :fecha_doc
      t.references :herramientum, null: false, foreign_key: true
      t.string :nombre_informe
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
