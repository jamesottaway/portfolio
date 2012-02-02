$: << File.dirname(__FILE__)+'/..'

require 'sinatra/base'
require 'portfolio'

class Portfolio::Server < Sinatra::Base
  set :root, File.dirname(__FILE__)+'/../..'

  get '/' do
    'Main directory page'
  end

  get '/:id' do
    "Photo #{params[:id]}"
  end
end
