class AddAttachmentImagemToPostagems < ActiveRecord::Migration[5.2]
  def self.up
    change_table :postagems do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :postagems, :imagem
  end
end
