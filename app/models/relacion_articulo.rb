class RelacionArticulo < ApplicationRecord
  belongs_to :articulo
  belongs_to :herramienta
end
