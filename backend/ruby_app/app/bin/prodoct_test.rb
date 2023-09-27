require'./lib/product.rb'

barr_1 = Product.new(
  name: "barr",
  id: 'a-1',
  price: 0.50
)

puts "product name: #{barr_1.name}"
puts "product id: #{barr_1.id}"
puts "product price: #{barr_1.price}"

barr_1.price = 1.0

puts "new product price: #{barr_1.price}" 