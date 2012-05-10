$: << File.dirname(__FILE__)+'/..'

module Portfolio
	class Category
		attr_accessor :title, :slug

		def initialize title
			self.title = title
			self.slug = to_slug(title)
		end

		def hash
			self.title.hash
		end

		def eql? other
			self.title == other.title
		end

		def == other
			eql? other
		end

		private

		def to_slug title
			title.downcase.gsub(' ', '_')
		end
	end
end
