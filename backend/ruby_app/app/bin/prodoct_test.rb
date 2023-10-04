require'./lib/product.rb'

prodoct1 = Product.new(
  name: "barr_1",
  id: 'a-1',
  price: 0.50
)

puts "product name: #{barr_1.name}"
#puts "product id: #{barr_1.id}"
#puts "product price: #{barr_1.price}"


prodoct2 = Product.new(
  name: "bitle_juce",
  id: 'b-2',
  price: 0.69
)

puts "product name: #{bitle_juce.name}"
#puts "product id: #{bitle_juce.id}"
#puts "product price: #{bitle_juce.price}"


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