class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def autenticar_usuario
        @usuario = Usuario.find_by( token: request.headers["token"]) rescue nil

        if @usuario.nil?
            return render json: "Você precisa realizar o login para acessar as informações.", status: 401
        end

        return @usuario

    end    
end
