class VendingMachine
  LAST_PLACE_NUMBER = 4
  MAX_PRODUCT_COUNT = 10

  def initialize
    @products = Array.new(MAX_PRODUCT_COUNT) { [] }
  end
  
  def add_product(product:, place_number:)
    if place_number >= 0 && place_number <= LAST_PLACE_NUMBER
      @products[place_number] << product
    else
      puts error
    end
  end
  
  attr_reader :products
end
