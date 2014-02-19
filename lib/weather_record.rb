WeatherRecord = Struct.new :day, :min_temp, :max_temp do
  def temperature_range
    max_temp - min_temp
  end
end
