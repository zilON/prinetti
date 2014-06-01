require 'prinetti'
# require 'webmock/rspec'

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end


RSpec.configure do |config|
  # config.fixture_path = File.expand_path("../spec/fixtures", __FILE__)

  config.order = "random"

  # config.infer_spec_type_from_file_location!
end

# WebMock.disable_net_connect!(:allow_localhost => true)
# HTTPI.log = false
