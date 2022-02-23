class Unidad < ApplicationRecord
    #has_one :tipo_unidad
    belongs_to :tipo_unidad
    belongs_to :entidad
    self.per_page = 10

    def domicilio
        "Calle: "+self.calle.to_s+" No. Ext. "+self.numero_ext.to_s+" No. Int. "+self.numero_int.to_s+" Colonia: "+self.colonia.to_s+" Entre calles: "+self.entre_calles_1.to_s+" y "+self.entre_calles_2.to_s+" Codigo Postal: "+self.codigo_postal.to_s
    end
    def nombre_con_clues
        "Clues: "+self.clues.to_s+" | Unidad: "+self.nombre.to_s
    end
    
end
