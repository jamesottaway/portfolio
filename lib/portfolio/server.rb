$: << File.dirname(__FILE__)+'/..'

require 'sinatra/base'

module Portfolio
  class Server < Sinatra::Base
  	set :public, 'public'
  end
end
