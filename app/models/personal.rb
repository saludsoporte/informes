class Personal < ApplicationRecord
    #belongs_to :user
    has_one :user
    self.per_page = 10

    def nombre_completo
        (self.nombre+" "+self.apellido_p+" "+self.apellido_m).titleize
    end
end
