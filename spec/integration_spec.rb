require "weather_munger"

describe WeatherMunger, "(integration)" do
  subject { WeatherMunger.new File.expand_path("../../data/weather.dat") }

  xit "prints the number of the day with the smallest temperature range" do
    $stdout = stdout = StringIO.new
    subject.call
    $stdout = STDOUT
    expect(stdout.string).to eq "14\n"
  end
end
