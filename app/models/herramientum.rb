class Herramientum < ApplicationRecord
  belongs_to :conexion_bd
  has_many :plantillas
  has_many :informe_ctrl_docum
  has_many :tabla_user_ids
  #belongs_to :dato
  self.per_page = 10

  def informacion
     self.nombre_sistema+" -> Nombre de la BD: "+self.conexion_bd.nombre_herramienta
  end

end
