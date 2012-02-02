$: << File.dirname(__FILE__)+'/..'

require 'portfolio'
require 'yaml'

class Portfolio::Data
  attr_reader :photos

  def initialize
    yaml = YAML.load_file('portfolio.yml')
    @photos = []
    yaml['photos'].each do |photo|
      @photos << Photo.new(photo['title'], photo['src'], photo['slug'])
    end
  end
end
