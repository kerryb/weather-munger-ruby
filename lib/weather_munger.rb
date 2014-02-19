class WeatherMunger
  def initialize file_path, reader: nil, finder: nil, printer: nil
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
