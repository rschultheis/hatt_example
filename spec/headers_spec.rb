require 'spec_helper'

describe "Request and response headers for Open Weather Map" do

  # this example demonstrates asserting on a header in a response
  it "should return application/json for content type" do
    weather_for 'Toronto, Canada'
    expect(owm.last_response.headers['Content-Type']).to eq 'application/json; charset=utf-8'
  end

  # This example demonstrates sending a custom header one time
  it "should ignore a non-sense request header" do
    city = "Austin, TX"
    owm.get "/data/2.5/weather?q=#{URI.encode(city)}&APPID=#{appid}",
      additional_headers: { 'NonSense' => 'MoreNonSense' }
    expect(owm.last_request[:headers]['NonSense']).to eq('MoreNonSense')
    expect(owm.last_response_status).to eq(200)
  end

  # This example demonstrates permanently setting, and unsetting a header
  it "should let me set a header permanently" do
    # first set a permanent header, make sure it gets sent
    owm.headers['MyPermanentHeader'] = '123abc'
    response = weather_for 'Anchorage, AK'
    expect(owm.last_request[:headers]['MyPermanentHeader']).to eq '123abc'

    # last, unset a header and make sure it does not get sent
    owm.headers.delete 'MyPermanentHeader'
    response = weather_for 'Anchorage, AK'
    expect(owm.last_request[:headers]['MyPermanentHeader']).to be_nil

  end
end
