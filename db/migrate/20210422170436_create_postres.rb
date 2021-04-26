class CreatePostres < ActiveRecord::Migration[6.0]
  def change
    create_table :postres do |t|
      t.string :nombre
      t.string :precio
      t.string :stock
      t.string :img 
      t.string :url
      t.timestamps
    end
  end
end
