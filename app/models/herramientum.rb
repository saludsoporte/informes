class Herramientum < ApplicationRecord
  belongs_to :conexion_bd
  belongs_to :dato
  self.per_page = 10
end
