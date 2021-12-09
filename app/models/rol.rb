class Rol < ApplicationRecord
    has_one :perfil

    def informacion
        self.nombre+" -> "+self.descripcion
    end
end
