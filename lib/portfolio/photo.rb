$: << File.dirname(__FILE__)+'/..'

require 'portfolio'

class Portfolio::Photo < Struct.new(:title, :src, :thumb, :id, :category)
end
