class Product
  def initialize(name:, id:, price:)
    @name = name
    @id = id
    @price = price
  end

  attr_accessor :price
  attr_reader :name, :id, :price
end