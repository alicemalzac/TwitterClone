class Solicitacao < ApplicationRecord
    belongs_to :usuario
    belongs_to :solicitado, :class_name => "Usuario"
end
