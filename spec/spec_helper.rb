$: << File.dirname(__FILE__)+'/../lib'

require 'portfolio'
require 'pry'

Dir[File.join(File.dirname(__FILE__),"../lib/portfolio/**/*.rb")].each { |f| require f }
Dir[File.join(File.dirname(__FILE__),"../spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
    config.mock_with :rspec
end
