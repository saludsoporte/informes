class InformeGeneral < ApplicationRecord
    belongs_to :partida
    belongs_to :herramientum
    belongs_to :user
    #has_one_attached :pdf, service: :local2
    mount_uploader :pdf, PdfUploader
    #validates_attachment_content_type :cober, content_type: /\Aimage\/.*\z/
    validates :nombre,presence: { message: "no puede estar vacio"}
    validates :herramientum_id, presence:true
    
    self.per_page = 10
end
