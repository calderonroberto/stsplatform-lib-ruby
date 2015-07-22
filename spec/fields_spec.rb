require 'stsplatform'
require 'spec_helper'

config = {auth:{key_id:KEY_ID,key_password:KEY_PASSWORD}}

describe "Fields" do
  before(:each) do
    @c = STSPlatform::Client.new(config) #TODO: add conf
    @test_s = STSPlatform::Sensors.new(@c, EXISTING_SENSOR_NAME)
    @test_f = STSPlatform::Fields.new(@test_s)
  end

  it "should get fields" do
    r = @test_f.get()
    expect(r).to be_a STSPlatform::STSPlatformResponse
    expect(r.code).to eq("200")
    expect(r.data[0]).to have_key('name')
  end

end
