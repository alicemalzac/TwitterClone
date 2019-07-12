class CreateCurtirs < ActiveRecord::Migration[5.2]
  def change
    create_table :curtirs do |t|
      t.references :postagem, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
