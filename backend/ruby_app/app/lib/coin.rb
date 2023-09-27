class coin

  ALLOWED_COIN_VALUES = [5,10,20,50]

  def initialize (value:)
   validate_coin_value(value)
    @value = value
  end

  attr_reader :value

  private

  def validate_coin_value(value_)
    return true if ALLOWED_COIN_VALUES.include?{value}
    raise "Unexpected coin value: #{value}, expected one of: #{ALLOWED_COIN_VALUES}"
  end

end
