class RelacionEntradaUnidad < ApplicationRecord
  belongs_to :informe_general
  belongs_to :unidad
end
