Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "usuario" do 
    post '', to: "usuarios#create"
    post 'login', to:"usuarios#login"
    delete 'logout', to:"usuarios#logout"
    put  '', to: "usuarios#update"
  end 
  scope "postagem" do
    post '', to: "postagems#create"
    put  ':id', to: "postagems#update"
    delete ':id', to:"postagems#destroy"
    get '', to: "postagems#list"
  end
  scope "solicitacoes" do
    post ':id', to: "solicitacaos#create"
    get 'enviadas', to: "solicitacaos#listar_solicitacoes_enviadas"
    get 'recebidas', to: "solicitacaos#listar_solicitacoes_recebidas"
    post 'amizade/:id', to: "amizades#resposta"
  end  
  scope "curtir" do 
    post ':id', to: "curtirs#curtir"
  end
end
