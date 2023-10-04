require'./lib/vendingmachine.rb'
require'./lib/product.rb'
vending_machine = VendingMachine.new

prodoct1 = Product.new(
  name: "barr",
  id: 'a-1',
  price: 0.50
)

prodoct2 = Product.new(
  name: "bitle_juce",
  id: 'b-2',
  price: 0.69
)

vending_machine.add_product(product: product1, place_number: 0)
vending_machine.add_product(product: product2, place_number: 1)


puts vending_machine.products.inspect