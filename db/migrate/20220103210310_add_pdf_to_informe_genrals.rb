class AddPdfToInformeGenrals < ActiveRecord::Migration[6.1]
  def change
    add_column :informe_generals, :pdf, :string
  end
end
