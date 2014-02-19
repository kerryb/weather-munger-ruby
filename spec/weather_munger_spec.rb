require "weather_munger"

describe WeatherMunger do
  let(:file_path) { "/foo/bar" }
  let(:record) { double :record }
  let(:records) { double :records }

  let(:reader) { double :reader }
  let(:finder) { double :finder }
  let(:printer) { double :printer, call: true }

  subject {
    WeatherMunger.new(file_path,
                      reader: reader,
                      finder: finder,
                      printer: printer
                     )
  }

  before do
    reader.stub(:call).with(file_path) { records }
    finder.stub(:call).with(records) { record }
  end

  it "reads the file, finds the right record and prints the result" do
    subject.call
    expect(printer).to have_received(:call).with record
  end
end
