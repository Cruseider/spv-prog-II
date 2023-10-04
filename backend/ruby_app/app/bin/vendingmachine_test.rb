require'./lib/vendingmachine.rb'
require'./lib/product.rb'
vending_machine = VendingMachine.new

barr_1 = Product.new(
  name: "barr_1",
  id: 'a-1',
  price: 0.50
)

bitle_juce = Product.new(
  name: "bitle_juce",
  id: 'b-2',
  price: 0.60
)

wizzle = Product.new(
  name:"wizzle",
  id:'c-3',
  price:0.90
)

pizza = Product.new(
  name:"pizza",
  id:'d-4',
  price:0.75
)

merinda = Product.new(
  name:"merinda"
  id:'e-5'
  price:1.00
)

vending_machine.add_product(product: barr_1, place_number: 0)
vending_machine.add_product(product: bitle_juce, place_number: 1)
vending_machine.add_product(product: wizzle, place_number: 2)
vending_machine.add_product(product: pizza, place_number: 3)
vending_machine.add_product(product: merinda, place_number: 4)

puts vending_machine.products.inspect