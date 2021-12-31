class AddCoverToInformeGenerals < ActiveRecord::Migration[6.1]
  def change
    add_attachment :informe_generals,:cover
  end
end
