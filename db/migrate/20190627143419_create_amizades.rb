class CreateAmizades < ActiveRecord::Migration[5.2]
  def change
    create_table :amizades do |t|
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
