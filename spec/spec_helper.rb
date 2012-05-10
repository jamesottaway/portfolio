$: << File.dirname(__FILE__)+'/../lib'

require 'pry'
require 'slim'

Dir[File.join(File.dirname(__FILE__),"../lib/portfolio/**/*.rb")].each { |f| require f }
Dir[File.join(File.dirname(__FILE__),"../spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
    config.mock_with :rspec
end

def render template_path, locals={}, inner=nil
  template = File.read(File.join(File.dirname(__FILE__), '../lib/portfolio/views', template_path))
  Slim::Template.new { template }.render(self, locals) { inner }
end

def to_slug title
  title.downcase.gsub(' ', '_')
end