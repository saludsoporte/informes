class InformeGeneral < ApplicationRecord
    belongs_to :partida
    belongs_to :herramientum
    self.per_page = 10
end
