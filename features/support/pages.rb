$: << File.dirname(__FILE__)+'/../pages'
require 'base_page'
Dir["#{File.dirname(__FILE__)}/pages/*_page.rb"].each {|r| require r }
