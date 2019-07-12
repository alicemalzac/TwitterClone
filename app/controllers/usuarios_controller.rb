class UsuariosController < ApplicationController
    after_action :set_header, except: :logout
    before_action :autenticar_usuario, except: [:create, :login]

    def create 
        @usuario = Usuario.new(usuario_params)

        if !params[:nome].nil? && !params[:email].nil? && !params[:username].nil? && !params[:password].nil?
            
            @usuario.token = set_token
            if @usuario.save!
                render json: biuld_json, status: 200
            end
        else   
            render json: "Alguma informação estava em branco", status: 400 
        end
    end    

    def login
    # byebug
        @usuario = Usuario.find_by(email: params[:email])
        if @usuario.try(:authenticate, params[:password])
            @usuario.update!(token: set_token)
            render json: biuld_json, status: 200
        else 
            render json: "Alguma informação estava em branco", status: 400  
        end

    end    
     
    def logout 
        @usuario.update!(token: nil)
        render json: "Sua sessão foi encerrada.", status: 200
    end   
    
    def update
        nome = !params[:nome].nil? ? params[:nome] : @usuario.nome
        unless params[:password].nil?  
            @usuario.password = params[:password]
            @usuario.save!
        end    
       @usuario.update(nome: nome)
       render json: biuld_json, status: 200
    end      

    private 

    def usuario_params
        params.permit(:nome, :username, :email, :password, :foto)
    end
    
    def set_token
        SecureRandom.uuid
    end
    
    def set_header
        response.set_header("token", @usuario.token)
    end

    def biuld_json
        json = {id: @usuario.id, 
                nome: @usuario.nome, 
                email: @usuario.email, 
                username: @usuario.username, 
                foto: "http://localhost:3000#{@usuario.foto}"}
    end    
end
