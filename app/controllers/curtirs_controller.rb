class CurtirsController < ApplicationController
  before_action :autenticar_usuario
  def curtir 
    curtida = Curtir.new(usuario_id: @usuario.id, postagem_id: params[:id])   
    postagem_curtida = Postagem.find_by(id: curtida.postagem_id) 
    curtida.save!
    render json: postagem_curtida , status: 200  
  end  

end
