class AmizadesController < ApplicationController
    before_action :autenticar_usuario

    def resposta
        # byebug
        # @amizade = Amizade.new
        amigo2 = Usuario.find_by(id: params[:id])

        amizade1 = Amizade.new(usuario_id: amigo2.id)
        amizade2 = Amizade.new(usuario_id: @usuario.id)

        @usuario.amizades << amizade1
        amigo2.amizades << amizade2

        # @amizade.save!

        render json: {amigo1: @usuario.amizades, amigo2: amigo2.amizades }, status:200

     end    
end  
