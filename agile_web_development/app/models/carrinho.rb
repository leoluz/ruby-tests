class Carrinho

  attr_reader :items

  def initialize
    @items = []
  end

  def add_produto(produto)
    current_item = @items.find { |item| item.produto == produto }
    if current_item
      current_item.incrementa_quantidade
    else
      current_item = ItemCarrinho.new(produto) 
      @items << current_item
    end
    current_item
  end

  def preco_total
    @items.sum { |item| item.preco }
  end

end
