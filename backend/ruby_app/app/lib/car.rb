class Car
  def initialize(manufacturer:, model:, color:, year:)
    @manufacturer = manufacturer
    @model = model
    @color = color
    @year = year
    @max_passanger_count =
    @passanger_count =
  end
  
  attr_reader :manufacturer, :model, :color, :year, :max_passanger_count, :passanger_count
  attr_writer :color, :year, :passanger_count

  def get_age
    Time.naw.year - year
  end
end