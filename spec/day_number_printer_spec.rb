require "day_number_printer"

describe DayNumberPrinter do
  describe "#call" do
    it "prints the day number of the supplied record" do
      $stdout = stdout = StringIO.new
      subject.call WeatherRecord.new(2, 4, 6)
      $stdout = STDOUT
      expect(stdout.string).to eq "2\n"
    end
  end
end
