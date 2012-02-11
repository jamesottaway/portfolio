$: << File.dirname(__FILE__)+'/..'

require 'portfolio'

class Photo < Struct.new(:title, :src, :id, :category)
end
