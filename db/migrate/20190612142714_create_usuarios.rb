class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nome, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :token

      t.timestamps
    end
  end
end
