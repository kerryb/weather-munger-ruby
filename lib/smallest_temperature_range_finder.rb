require "weather_record"

class SmallestTemperatureRangeFinder
  def call records
    records.inject {|result, record|
      record.temperature_range < result.temperature_range ? record : result
    }
  end
end
