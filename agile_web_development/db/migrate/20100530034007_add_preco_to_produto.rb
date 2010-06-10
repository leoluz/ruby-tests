class AddPrecoToProduto < ActiveRecord::Migration
  def self.up
    add_column :produtos, :preco, :decimal, :precision => 8, :scale => 2, :default => 0
  end

  def self.down
    remove_column :produtos, :preco
  end
end
