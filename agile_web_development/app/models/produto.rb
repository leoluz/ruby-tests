class Produto < ActiveRecord::Base

  validates_presence_of :titulo, :descricao, :image_url
  validates_length_of :descricao,
                      :minimum => 10,
                      :message => 'A descricao do produto deve ter pelo ' +
                                  'menos 10 caracteres'
  validates_numericality_of :preco
  validate :preco_deve_ser_pelo_menos_um_centavo
  validates_uniqueness_of :titulo
  validates_format_of :image_url,
                      :with     => %r{\.(gif|jpg|png)$}i,
                      :message  => 'deve apontar para uma imagem com os ' +
                                   'seguintes formatos: GIF, JPG ou PNG'

  def self.find_produtos_a_venda
    find(:all, :order => "titulo")
  end
protected
  def preco_deve_ser_pelo_menos_um_centavo
    errors.add(:preco, 'deve ser pelo menos 0,01') if preco.nil? || preco < 0.1
  end
end
