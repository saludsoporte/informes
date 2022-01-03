class InformeGeneral < ApplicationRecord
    belongs_to :partida
    belongs_to :herramientum
    #has_one_attached :pdf, service: :local2
    mount_uploader :pdf, PdfUploader
    #validates_attachment_content_type :cober, content_type: /\Aimage\/.*\z/
    self.per_page = 10
end
