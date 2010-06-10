class StoreController < ApplicationController

  def index
    @produtos = Produto.find_produtos_a_venda
  end

  def add_to_carrinho
    produto = Produto.find(params[:id])
    @carrinho = find_carrinho
    @carrinho.add_produto(produto)
  end

private

  def find_carrinho
    session[:carrinho] ||= Carrinho.new
  end
end
