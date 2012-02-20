$: << File.dirname(__FILE__)+'/..'

require 'sinatra/base'
require 'slim'
require 'portfolio'
require 'portfolio/data'

class Portfolio::Server < Sinatra::Base
  set :root, File.dirname(__FILE__)+'/../..'
  set :views, File.dirname(__FILE__)+'/views'

  get '/' do
    data = Portfolio::Data.new
    @categories = data.categories
    slim :home
  end

  get '/:id' do
    data = Portfolio::Data.new
    @photo = data.find_by_id(params[:id])
    @title = @photo.title
    slim :photo
  end

  get '/category/:slug' do
    data = Portfolio::Data.new
    @category = data.find_by_slug(params[:slug])
    @title = @category.title
    @photos = data.find_by_category @category.title
    slim :category
  end
end
