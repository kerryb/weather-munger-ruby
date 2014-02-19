require "smallest_temperature_range_finder"

describe SmallestTemperatureRangeFinder do
  describe "#call" do
    it "returns the record with the smallest temperature range" do
      record_1 = WeatherRecord.new 1, 10, 20
      record_2 = WeatherRecord.new 2, 14, 15
      record_3 = WeatherRecord.new 3, 5, 10
      expect(subject.call [record_1, record_2, record_3]).to eq record_2
    end
  end
end
