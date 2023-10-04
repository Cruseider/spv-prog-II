require'./lib/product.rb'

prodoct1 = Product.new(
  name: "barr",
  id: 'a-1',
  price: 0.50
)

puts "product name: #{barr_1.name}"
puts "product id: #{barr_1.id}"
puts "product price: #{barr_1.price}"

barr_1.price = 1.0

puts "new product price: #{barr_1.price}" 


prodoct2 = Product.new(
  name: "bitle_juce",
  id: 'b-2',
  price: 0.69
)

puts "product name: #{bitle_juce.name}"
puts "product id: #{bitle_juce.id}"
puts "product price: #{bitle_juce.price}"