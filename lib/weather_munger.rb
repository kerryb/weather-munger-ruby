require "weather_data_reader"
require "smallest_temperature_range_finder"
require "day_number_printer"

class WeatherMunger
  def initialize(file_path,
                 reader: WeatherDataReader.new,
                 finder: SmallestTemperatureRangeFinder.new,
                 printer: DayNumberPrinter.new
                )
    @file_path = file_path
    @reader = reader
    @finder = finder
    @printer = printer
  end

  def call
    records = @reader.call @file_path
    record = @finder.call records
    @printer.call record
  end
end
