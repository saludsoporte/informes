class RelacionHerramientum < ApplicationRecord
  belongs_to :informe_general
  belongs_to :herramienta
  self.per_page = 10
end
