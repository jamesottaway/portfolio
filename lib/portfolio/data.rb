$: << File.dirname(__FILE__)+'/..'

require 'yaml'
require 'portfolio'
require 'portfolio/photo'

class Portfolio::Data
  attr_reader :photos

  def initialize
    yaml = YAML.load_file('portfolio.yml')
    @photos = []
    yaml['photos'].each do |photo|
      @photos << Photo.new(photo['title'], photo['src'], photo['id'], photo['category'])
    end
  end

  def find_by_id id
    @photos.select { |photo| photo.id == id }.first
  end
end
