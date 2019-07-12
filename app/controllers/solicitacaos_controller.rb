class SolicitacaosController < ApplicationController
    before_action :autenticar_usuario

    def create 
       
        if params[:id].nil? || params[:id] == @usuario.id.to_s
            return render json: "Solicitacao inválida.", status:400
        end        
        solicitacao = Solicitacao.new(usuario_id: @usuario.id, solicitado_id: params[:id])
        solicitacao.save!
        render json: solicitacao  
    end    

    def listar_solicitacoes_enviadas

        solicitacao = []
       @usuario.solicitacaos.each do |s|
        solicitacao << s 
       end
    render json: solicitacao, status: 200
    end
    
    def listar_solicitacoes_recebidas
       solicitacao = []
       Solicitacao.where(solicitado_id: @usuario.id).each do |s|
        solicitacao << s 
       end
    render json: solicitacao, status: 200

    # app = Rpush::Apns::App.new
    # app.name = "treinamento_app"
    # app.certificate = File.read("/path/to/sandbox.pem")
    # app.environment = "development" # APNs environment.
    # app.password = "certificate password"
    # app.connections = 1
    # app.save!

    # n = Rpush::Apns::Notification.new
    # n.app = Rpush::Apns::App.find_by_name("treinamento_app")
    # n.device_token = "..." # hex string
    # n.alert = "hi mom!"
    # n.data = { foo: :bar }
    # n.save!
    # end

end
