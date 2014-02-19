require "weather_record"

class WeatherDataReader
  DATA_PATTERN = /^\s*(?<day>\d+)\s+(?<max_temp>\d+)\*?\s+(?<min_temp>\d+)/

  def read path
    File.read(path).lines.select {|line|
      line =~ DATA_PATTERN }.map {|line|
      fields = line.match(DATA_PATTERN)
      WeatherRecord.new fields[:day].to_i, fields[:max_temp].to_i, fields[:min_temp].to_i
    }
  end
end
