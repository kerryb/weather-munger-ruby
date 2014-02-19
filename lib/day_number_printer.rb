require "weather_record"

class DayNumberPrinter
  def call record
    puts record.day
  end
end
