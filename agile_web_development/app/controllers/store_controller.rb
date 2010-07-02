class StoreController < ApplicationController

  attr_reader :contador

  def index
    @produtos = Produto.find_produtos_a_venda
    @carrinho = find_carrinho
    @contador = inc_contador
  end

  def add_to_carrinho
    produto = Produto.find(params[:id])
    @carrinho = find_carrinho
    @carrinho.add_produto(produto)
    session[:contador] = nil
    respond_to do |format|
      format.js
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Tentativa de acessar um produto com codigo invalido #{params[:id]}")
    redirect_to_index 'Produto Invalido'
  end

  def limpar_carrinho
    session[:carrinho] = nil
    redirect_to_index 'O seu carrinho esta vazio' 
  end

private

  def find_carrinho
    session[:carrinho] ||= Carrinho.new
  end

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end

  def inc_contador
    session[:contador] ||= 0
    session[:contador] += 1
  end
end
