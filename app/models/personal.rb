class Personal < ApplicationRecord
    #belongs_to :user
    has_one :user
    self.per_page = 10
end
