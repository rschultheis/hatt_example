require 'spec_helper'

describe 'getting weather reports' do
  it 'should know the weather for New York City' do
    response = weather_for 'New York, NY'
    expected_items = ['temp', 'temp_min', 'temp_max', 'humidity', 'pressure']
    expect(response['main'].keys).to include(*expected_items)
    # the temp is in kelvin, so it looks kinda wierd
    expect(response['main']['temp']).to be_between(100, 400)
  end
end
