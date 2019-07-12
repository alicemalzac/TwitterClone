class PostagemsController < ApplicationController
    before_action :autenticar_usuario
    before_action :set_postagem, except: [:create, :list] 
    

    def create 
        @postagem = Postagem.new(postagem_params)

        if @postagem.nil?
            return render json: "A postagem está em branco", status: 400     
        else 
            @usuario.postagems << @postagem
            @postagem.save!
            render json: biuld_json, status: 200
        end    
    end
  
    
    def update
     
        unless params[:mensagem].nil?  
            @postagem.update(mensagem: params[:mensagem])
            return render json: biuld_json, status: 200
        else 
            return render json: "A postagem está em branco", status: 400 
        end    
    end

    def destroy
            @postagem.destroy
            return render json: biuld_json, status: 200 
    end

    def list 
        lista_ids = Amizade.where(usuario_id: @usuario.id).map(&:id).uniq
        lista_ids << @usuario.id
        if params[:query].nil?
            @postagem = Postagem.where(usuario_id: lista_ids).order(created_at: :desc).page(params[:pagina]).per(20)    
        else
            @postagem = Postagem.where(usuario_id: lista_ids).where(["mensagem LIKE ? OR mensagem LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"]).order(created_at: :desc).page(params[:pagina]).per(20)
        end
        render json: @postagem, status: 200

    end    

    private

    def postagem_params
        params.permit(:mensagem, :imagem)
    end    

    def set_postagem
        @postagem = Postagem.find_by(id: params[:id])

        if @postagem.nil?
            return render json: "Id não encontrado", status: 400  
        end
    end   

    def biuld_json
        json = {id: @postagem.id, 
                mensagem: @postagem.mensagem,
                imagem: "http://localhost:3000#{@postagem.imagem}",
                postagem: "@#{@usuario.username}: #{@postagem.mensagem}",
                usuario_id: @postagem.usuario_id,
                created_at: @postagem.created_at.to_i,
                qtd_curtidas: curtir.where(postagem_id: @postagem.id).count
                }
    end
end
 