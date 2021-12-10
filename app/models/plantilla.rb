class Plantilla < ApplicationRecord
  belongs_to :herramienta
  belongs_to :dato
  self.per_page = 10
end
