class CreateSolicitacaos < ActiveRecord::Migration[5.2]
    def self.up
      create_table :solicitacaos do |t|
        t.integer :usuario_id
        t.integer :solicitado_id
        t.timestamps
      end
    end
    
    def self.down
      drop_table :solicitacaos
    end
  end
