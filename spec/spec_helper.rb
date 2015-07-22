RSpec.configure do |c|
  c.add_setting :key_id, :default => '' #TODO: Add
  c.add_setting :key_password, :default => '' #TODO: Add
  c.add_setting :random_sensor_name, :default => ('a'..'z').to_a.shuffle[0,8].join
  c.add_setting :existing_sensor_name, :default => 'tests'
  c.add_setting :random_value, :default => rand(0..1000)
end

KEY_ID = RSpec.configuration.key_id
KEY_PASSWORD = RSpec.configuration.key_password
EXISTING_SENSOR_NAME = RSpec.configuration.existing_sensor_name
RANDOM_SENSOR_NAME = RSpec.configuration.random_sensor_name
RANDOM_VALUE = RSpec.configuration.random_value
