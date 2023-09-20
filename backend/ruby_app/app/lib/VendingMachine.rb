class Product
  attr_accessor :name, :id, :price

  def initialize(name, id, price)
    @name = name
    @id = id
    @price = validate_price(price)
  end

  def validate_price(price)
    raise "Cena jādalās ar 5!" if price % 5 != 0
    price
  end
end

class Coin
  attr_accessor :value

  def initialize(value)
    @value = validate_value(value)
  end

  def validate_value(value)
    available_values = [5, 10, 20, 50]
    raise "Nepieejama monētas vērtība!" unless available_values.include?(value)
    value
  end
end

class VendingMachine
  def initialize
    @slots = Array.new(5) { [] } 
    @max_products_per_slot = 10
    @coins = Hash.new(0)
  end

  def add_product(slot_number, product)
    if slot_number >= 1 && slot_number <= 5
      if @slots[slot_number - 1].length < @max_products_per_slot
        @slots[slot_number - 1] << product
        puts "#{product.name} pievienots vietā #{slot_number}"
      else
        puts "Vietā #{slot_number} jau ir maksimālais produkta daudzums."
      end
    else
      puts "Nepareizs slot numurs. Slot numurs jābūt no 1 līdz 5."
    end
  end

  def insert_coin(coin)
    if coin.is_a?(Coin)
      @coins[coin.value] += 1
      puts "Iemesta monēta ar vērtību #{coin.value}. Kopējā summa: #{total_amount} "
    else
      puts "Nepareiza monētas objekta klase."
    end
  end

  def total_amount
    @coins.sum { |value, count| value * count }
  end

  def choose_product(slot_number)
    if slot_number >= 1 && slot_number <= 5
      slot = @slots[slot_number - 1]
      if slot.empty?
        puts "Vietā #{slot_number} produkts nav pieejams."
        return nil
      end

      product = slot.first
      product_price = product.price

      if total_amount >= product_price
        @coins.each do |value, count|
          while count > 0 && total_amount >= product_price
            if value <= total_amount - product_price
              product_price -= value
              count -= 1
            else
              break
            end
          end
        end

        if product_price == 0
          @slots[slot_number - 1].shift
          puts "Izvēlētais produkts: #{product.name}"
          change = @coins.select { |value, count| count > 0 }.map { |value, count| Coin.new(value) }
          @coins.clear
          change.each { |coin| insert_coin(coin) }
          return product
        else
          puts "Nepietiek monētu, lai nopirktu šo produktu."
          return nil
        end
      else
        puts "Nepietiek monētu, lai nopirktu šo produktu."
        return nil
      end
    else
      puts "Nepareizs slot numurs. Slot numurs jābūt no 1 līdz 5."
      return nil
    end
  end

  def fill(coins_to_add)
    coins_to_add.each do |coin|
      insert_coin(coin)
    end
  end
end