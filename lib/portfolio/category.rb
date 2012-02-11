$: << File.dirname(__FILE__)+'/..'

require 'portfolio'

class Portfolio::Category
	attr_accessor :title, :slug

	def initialize title
		self.title = title
		self.slug = to_slug(title)
	end

	private

	def to_slug title
		title.downcase.gsub(' ', '_')
	end
end
