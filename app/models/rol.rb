class Rol < ApplicationRecord
    has_one :perfil

    self.per_page = 10

    def informacion
        self.nombre+" -> "+self.descripcion
    end
end
