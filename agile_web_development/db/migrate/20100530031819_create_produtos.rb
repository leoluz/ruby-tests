class CreateProdutos < ActiveRecord::Migration
  def self.up
    create_table :produtos do |t|
      t.string :titulo
      t.text :descricao
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :produtos
  end
end
