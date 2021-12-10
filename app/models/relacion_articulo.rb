class RelacionArticulo < ApplicationRecord
  belongs_to :articulo
  belongs_to :herramienta
  self.per_page = 10
end
