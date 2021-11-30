class RelacionHerramientum < ApplicationRecord
  belongs_to :informe_general
  belongs_to :herramienta
end
