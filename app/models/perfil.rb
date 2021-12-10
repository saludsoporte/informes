class Perfil < ApplicationRecord
    belongs_to :user
    belongs_to :rol
    self.per_page = 10
end
