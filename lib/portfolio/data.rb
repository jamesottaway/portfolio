$: << File.dirname(__FILE__)+'/..'

require 'yaml'
require 'portfolio'
require 'portfolio/photo'
require 'portfolio/category'

class Portfolio::Data
  attr_reader :photos, :categories

  def initialize
    yaml = YAML.load_file('portfolio.yml')
    @photos = []
    yaml['photos'].each do |photo|
      @photos << Portfolio::Photo.new(photo['title'], photo['src'], photo['id'], photo['category'])
    end
    @categories = []
    yaml['photos'].each do |photo|
      @categories << Portfolio::Category.new(photo['category'])
    end
    @categories.uniq!
  end

  def find_by_id id
    @photos.select { |photo| photo.id == id }.first
  end

  def find_by_category category
    @photos.select { |photo| photo.category == category }
  end

  def categories
    @categories
  end

  def find_by_slug slug
    @categories.select { |category| category.slug == slug }.first
  end
end
