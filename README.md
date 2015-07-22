# Stsplatform

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/stsplatform`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Dependencies

* Ruby > 2.2.1

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stsplatform'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stsplatform

## Getting Started

Require the stsplatform gem. Make sure to install it
To install from source run: "bundle exec rake install"
to install from RubyGems run : "gem install stsplatform"

```
require 'stsplatform'
```

Create an STS Platform client:

```
c = STSPlatform::Client.new()
```


Print a sensor hosted in the platform:

```
s = STSPlatform::Sensors.new(c, 'calderonroberto.demo')
res = s.get()
puts res.data
```

Print some data (last data point):

To acccess data from a sensor create a data object that uses the sensor object

```
d = STSPlatform::Data.new(s)
res = d.get({beforeE:1})
puts res.data
```

## Using the Library

All methods rely on the Client Class. The parameter CONF is not required, but allows you to configure your client to specify your credentials and url of the STS Platform instance you want to access. By default the client will use the community edition of the STS Platform (WoTKit):

A common configuration object is:

```
CONF = {url:"http://wotkit.sensetecnic.com/api", auth:{key_id:YOURKEYID,key_password:YOURKEYPASSWORD}}
```

You can then instantiate your client like this:

```
c = STSPlatform::Client.new(CONF)
```

To access resources you build them hierarchically. A sensor lives in an STS Platform Server:


```
c = STSPlatform::Client.new(CONF)
s = STSPlatform::Sensors.new(c, 'SENSORNAME')
```

Sensor data lives in a Sensor:

```
c = STSPlatform::Client.new(CONF)
s = STSPlatform::Sensors.new(c, 'SENSORNAME')
d = STSPlatform::Data .new(s)
```

And so on. Each element that uses the Client class can access GET, POST, PUT and DELETE methods. These methods take parameters and return a STSPlatformResponse object containing "data" and "code". Data is the parsed response from the STS Platform server. Code is a string response code from the STS Platform server:

```
c = STSPlatform::Client.new(CONF)
s = STSPlatform::Sensors.new(c, 'SENSORNAME')
d = STSPlatform::Data .new(s)
response = d.get({parameter:parametervalue})

puts response.code
puts response.data
```

For more information on the API, support and examples visit [http://developers.sensetecnic.com](http://developers.sensetecnic.com)

## Supported Resources

To get started first require the library

```
require 'stsplatform'
```

### Configuring the Client

By default the library does not need a configuration to access public sensors. You can configure the client to use a different STS Platform URL (in this case the free version 'WoTKit'). You can also configure it to use a username and password or a valid key_id and key_password:

```
conf = {
  url:"http://wotkit.sensetecnic.com/api",
  #auth:{key_id:YOURKEYID,key_password:YOURKEYPASSWORD}
  #auth:{username:USERNAME,password:PASSWORD}
  }
client = STSPlatform::Client.new(conf)
```

### Get Sensors

```
c = STSPlatform::Client.new(config)
s = STSPlatform::Sensors.new(c, SENSOR_NAME)
puts s.get().data
```

### Get Data

```
c = STSPlatform::Client.new(config)
s = STSPlatform::Sensors.new(c, SENSOR_NAME)
d = STSPlatform::Data.new(s)
puts d.get({beforeE:1}).data
```

### Publish Data

```
c = STSPlatform::Client.new(config)
s = STSPlatform::Sensors.new(c, SENSOR_NAME)
d = STSPlatform::Data.new(s)
puts d.post({value:100}).code #print response code
puts d.get({beforeE:1}).data
```

### Get Sensor Fields

```
c = STSPlatform::Client.new(config)
s = STSPlatform::Sensors.new(c, SENSOR_NAME)
fs = STSPlatform::Fields.new(s)
puts fs.get().data
f = STSPlatform::Fields.new(s, "value")
puts f.get().data
```

### Organizations

```
c = STSPlatform::Client.new(config)
o = STSPlatform::Orgs.new(c, 'sensetecnic')
puts o.get().data
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

* To install this gem onto your local machine, run `bundle exec rake install`.
* To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SenseTecnic/stsplatform-lib-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
