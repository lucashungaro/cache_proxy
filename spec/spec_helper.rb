$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'cache_proxy'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  config.mock_with :mocha
end
