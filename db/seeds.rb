require 'faker'

Usuario.create(nome: "alice",
           username: "alice", 
              email: "alice@email.com", 
           password: "1234")

Usuario.create(nome: "jobson",
           username: "jobson", 
              email: "jobson@email.com", 
           password: "1234"
)
50.times do
Postagem.create(
    mensagem: Faker::Movies::HarryPotter.quote, 
    usuario_id: Faker::Number.between(1,2)
)
end
puts "Criando Postagem"