class CreatePostagems < ActiveRecord::Migration[5.2]
  def change
    create_table :postagems do |t|
      t.string :mensagem
      t.references :usuario, foreign_key:true

      t.timestamps
    end
  end
end
