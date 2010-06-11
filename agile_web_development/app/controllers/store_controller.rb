class StoreController < ApplicationController

  def index
    @produtos = Produto.find_produtos_a_venda
  end

  def add_to_carrinho
    produto = Produto.find(params[:id])
    @carrinho = find_carrinho
    @carrinho.add_produto(produto)
  rescue ActiveRecord::RecordNotFound
    logger.error("Tentativa de acessar um produto com codigo invalido #{params[:id]}")
    flash[:notice] = "Produto Invalido"
    redirect_to :action => 'index'
  end

private

  def find_carrinho
    session[:carrinho] ||= Carrinho.new
  end
end
