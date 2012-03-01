$: << File.dirname(__FILE__)+'/..'

require 'yaml'
require 'portfolio'
require 'portfolio/photo'
require 'portfolio/category'

class Portfolio::Data
  attr_accessor :photos, :categories

  def initialize
    yaml = YAML.load_file('portfolio.yml')
    self.photos = []
    yaml['photos'].each do |photo|
      self.photos << Portfolio::Photo.new(photo['title'], photo['src'], photo['id'], photo['category'])
    end
    self.categories = []
    yaml['photos'].each do |photo|
      self.categories << Portfolio::Category.new(photo['category'])
    end
    self.categories.uniq!
  end

  def find_photo_by_id id
    photos.select { |photo| photo.id == id }.first
  end

  def find_photos_by_category category
    photos.select { |photo| photo.category == category }
  end

  def find_category_by_slug slug
    categories.select { |category| category.slug == slug }.first
  end
end
