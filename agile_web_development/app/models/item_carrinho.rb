class ItemCarrinho

  attr_reader :produto, :quantidade

  def initialize(produto)
    @produto = produto
    @quantidade = 1
  end

  def incrementa_quantidade
    @quantidade += 1
  end

  def titulo
    @produto.titulo
  end

  def preco
    @produto.preco * @quantidade
  end

end
