class Usuario < ApplicationRecord
    has_many :amizades, dependent: :destroy
    has_many :postagems, dependent: :destroy
    has_many :solicitacaos
    has_many :solicitado, :through => :solicitacaos
    # has_many :curtir, :through => :curtirs
    has_secure_password
    has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }#, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
end