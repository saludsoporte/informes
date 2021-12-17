class Partida < ApplicationRecord
    self.per_page = 10
    
    def informacion
        self.partida.to_s+"-> Descripción: "+self.descripcion
    end
end
