require "weather_data_reader"
require "tempfile"

describe WeatherDataReader do
  describe "#read" do
    let(:file) { Tempfile.new "weather" }

    def create_file contents
      file.write contents
      file.close
      file.path
    end

    it "reads weather records from a file" do
      path = create_file <<-EOF
   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
      EOF
      expect(subject.read path).to eq [
        WeatherRecord.new(1, 59, 88),
        WeatherRecord.new(2, 63, 79),
      ]
    end

    it "ignores non-data lines" do
      path = create_file <<-EOF
Header

  Foo Bar 123 456 789
   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
      EOF
      expect(subject.read path).to eq [
        WeatherRecord.new(1, 59, 88),
      ]
    end

    it "ignores asterisks by temperatures" do
      path = create_file <<-EOF
   1  88*   59*   74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
      EOF
      expect(subject.read path).to eq [
        WeatherRecord.new(1, 59, 88),
      ]
    end
  end
end
