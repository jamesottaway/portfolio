$: << File.dirname(__FILE__)+'/..'

module Portfolio
	class Photo < Struct.new(:title, :src, :thumb, :id, :category)
	end
end
