require 'stsplatform'
require 'spec_helper'

config = {auth:{key_id:KEY_ID,key_password:KEY_PASSWORD}}

new_sensor = {
    name:RANDOM_SENSOR_NAME,
    longName:'Delete Me Sensor',
    description:'Auto generated for tests..',
    tags: ['elephants']
    }

describe "Sensors" do
  before(:each) do
    @c = STSPlatform::Client.new(config) #TODO: add conf
    @s = STSPlatform::Sensors.new(@c)
    @test_s = STSPlatform::Sensors.new(@c, EXISTING_SENSOR_NAME)
  end

  it "should get sensor" do
    r = @test_s.get()
    expect(r).to be_a STSPlatform::STSPlatformResponse
    expect(r.code).to eq("200")
    expect(r.data['name']).to eq(EXISTING_SENSOR_NAME)
  end

  it "should query sensors" do
    r = @s.get({text:"sensors"})
    expect(r).to be_a STSPlatform::STSPlatformResponse
    expect(r.code).to eq("200")
    expect(r.data).not_to be_empty
  end

  it "should create a sensor" do
    r = @s.post(new_sensor)
    expect(r.code).to eq("201")
  end

  it "should update a sensor" do
    s = STSPlatform::Sensors.new(@c, RANDOM_SENSOR_NAME)
    r = s.put({description:'Sensor auto generated for tests..Modified'})
    expect(r.code).to eq("204")
  end

  it "should delete a sensor" do

    s = STSPlatform::Sensors.new(@c, RANDOM_SENSOR_NAME)
    r = s.delete()
    expect(r.code).to eq("204")
  end


end
