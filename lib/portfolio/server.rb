$: << File.dirname(__FILE__)+'/..'

require 'sinatra/base'

module Portfolio
  class Server < Sinatra::Base
  	set :public_folder, 'public'
  end
end
