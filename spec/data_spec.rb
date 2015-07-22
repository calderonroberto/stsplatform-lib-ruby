require 'stsplatform'
require 'spec_helper'

config = {auth:{key_id:KEY_ID,key_password:KEY_PASSWORD}}

describe "Data" do
  #TODO: this should probably be inherited for all tests
  before(:each) do
    @c = STSPlatform::Client.new(config) #TODO: add conf
    @s = STSPlatform::Sensors.new(@c)
    @test_s = STSPlatform::Sensors.new(@c, EXISTING_SENSOR_NAME)
    @d = STSPlatform::Data.new(@s)
    @test_d = STSPlatform::Data.new(@test_s)
  end

  it "should post data" do
    r = @test_d.post({value:RANDOM_VALUE})
    expect(r).to be_a STSPlatform::STSPlatformResponse
    expect(r.code).to eq("201")
  end

  it "should get a sensor's data" do
    r = @test_d.get({beforeE:1})
    expect(r).to be_a STSPlatform::STSPlatformResponse
    expect(r.code).to eq("200")
    expect(r.data[0]['value']).to eq(RANDOM_VALUE)#last data point posted above
  end

end
