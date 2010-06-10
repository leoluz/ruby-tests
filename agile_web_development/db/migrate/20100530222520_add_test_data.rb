class AddTestData < ActiveRecord::Migration
  def self.up
    Produto.delete_all

    Produto.create(:titulo     => 'Chinelo Trancado Lilas',
                   :descricao  => %{<p>Lindo chinelo havainas com <b>frente trancada</b> 
                                    toda a correia bordada em pedrarias.</p>},
                   :image_url  => '/images/LilasUmLado-2.jpg',
                   :preco      => 60.00)

    Produto.create(:titulo     => 'Chinelo Trancado Estampado',
                   :descricao  => %{<p>Lindo chinelo modelo havainas estampado com apenas uma correia, 
                                    <b>bordado a mao</b> com pedrarias.</p>},
                   :image_url  => '/images/verdeestampa.jpg',
                   :preco      => 70.00)

    Produto.create(:titulo     => 'Chinelo Strass Branco e Preto',
                   :descricao  => %{<p>Lindo chinelo modelo havainas, bordado a mao com <b>strass e fita 
                                     de cetim</b>. Disponivel nas cores branco e preto.</p>},
                   :image_url  => '/images/BrancoPretoNew-3.jpg',
                   :preco      => 65.50)

  end

  def self.down
    Produto.delete_all
  end
end
