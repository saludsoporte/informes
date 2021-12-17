class RelacionDato < ApplicationRecord
  belongs_to :herramientum
  belongs_to :dato
  self.per_page = 10
end
