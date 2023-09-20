class person
  def initialize(gender, skin_color, name)
    @gender = gender
    @skin_color = skin_color
    @name = name
  end

  attr_reader :gender, :skin_color, :name

end