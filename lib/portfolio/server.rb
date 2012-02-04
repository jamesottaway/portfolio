$: << File.dirname(__FILE__)+'/..'

require 'sinatra/base'
require 'slim'
require 'portfolio'
require 'portfolio/data'

class Portfolio::Server < Sinatra::Base
  set :root, File.dirname(__FILE__)+'/../..'
  set :views, File.dirname(__FILE__)+'/views'

  get '/' do
    'Main directory page'
  end

  get '/:id' do
    data = Portfolio::Data.new
    @photo = data.find_by_id(params[:id])
    slim :photo
  end
end
