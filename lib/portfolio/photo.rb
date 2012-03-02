$: << File.dirname(__FILE__)+'/..'

module Portfolio;end

class Portfolio::Photo < Struct.new(:title, :src, :thumb, :id, :category)
end
