require 'spec_helper'

describe "Respose codes for Open Weather Map" do
  it "should return 200 for a successful query" do
    weather_for 'San Francisco, CA'
    expect(owm.last_response_status).to eq 200
  end

  it "should return 404 for an unsuccessful query" do
    expect { weather_for 'xyxyxyxyx' }.to raise_error { |err|
        expect(err).to be_a(Hatt::RequestException)
        expect(err.code).to equal(404)
      }
  end
end
