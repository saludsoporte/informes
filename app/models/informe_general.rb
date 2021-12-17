class InformeGeneral < ApplicationRecord
    belongs_to :partida
    self.per_page = 10
end
