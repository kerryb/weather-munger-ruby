require "weather_record"

describe WeatherRecord do
  describe "#temperature_range" do
    it "is the difference between min_temp and max_temp" do
      record = WeatherRecord.new 1, 10, 25
      expect(record.temperature_range).to eq 15
    end
  end
end
