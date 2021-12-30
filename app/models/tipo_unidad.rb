class TipoUnidad < ApplicationRecord
    has_one :unidad
    def unidad_id
        self.id
    end
end
