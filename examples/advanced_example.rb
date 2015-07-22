require 'stsplatform'

#TODO: Configure your credentials and sensor
SENSOR_NAME = ''
KEY_ID = ''
KEY_PASSWORD = ''

config = {auth:{key_id:KEY_ID,key_password:KEY_PASSWORD}}

### Get Sensors

puts "\nGet Sensors"
c = STSPlatform::Client.new(config)
s = STSPlatform::Sensors.new(c, SENSOR_NAME)
puts s.get().data

### Get Data

puts "\nGet Data"
c = STSPlatform::Client.new(config)
s = STSPlatform::Sensors.new(c, SENSOR_NAME)
d = STSPlatform::Data.new(s)
puts d.get({beforeE:1}).data

### Publish Data

puts "\nPublish Data"
c = STSPlatform::Client.new(config)
s = STSPlatform::Sensors.new(c, SENSOR_NAME)
d = STSPlatform::Data.new(s)
puts d.post({value:100}).code #print response code
puts d.get({beforeE:1}).data

### Get Sensor Fields

puts "\nSensor Fields"
c = STSPlatform::Client.new(config)
s = STSPlatform::Sensors.new(c, SENSOR_NAME)
fs = STSPlatform::Fields.new(s)
puts fs.get().data
f = STSPlatform::Fields.new(s, "value")
puts f.get().data

### Organizations

puts "\nGet Organization"
c = STSPlatform::Client.new(config)
o = STSPlatform::Orgs.new(c, 'sensetecnic')
puts o.get().data
