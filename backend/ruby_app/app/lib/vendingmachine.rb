class VendingMachine
 
  
  def initialize
    @products = Array.new(10) { [] }
  end

  def add_product(product:, place_number:)
    products[place_number] << product
  end
  
  attr_reader :products
end