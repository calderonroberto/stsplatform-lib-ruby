# Require the stsplatform gem. Make sure to install it
# To install from source run: "bundle exec rake install"
# to install from RubyGems run : "gem install stsplatform"
require 'stsplatform'

# A sensor to use for this example. We will use
SENSOR_NAME = 'calderonroberto.demo'

# First, create a client that will handle all the REST calls
c = STSPlatform::Client.new()

# Create a sensor object, that uses the client:
s = STSPlatform::Sensors.new(c, SENSOR_NAME)

# Print the sensor object:
res = s.get()
puts res.data
puts res.code

# To acccess data from a sensor create a data object that uses the sensor object
d = STSPlatform::Data.new(s)

# Print the last data point. Do a get request on the data resource, passing
# a parameter: "beforeE", according to:
# http://wotkit.readthedocs.org/en/latest/api_v1/api_sensor_data.html#raw-data-retrieval
res = d.get({beforeE:1})
puts res.data
puts res.code
