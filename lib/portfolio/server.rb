$: << File.dirname(__FILE__)+'/..'

require 'sinatra/base'
require 'slim'
require 'portfolio'
require 'portfolio/data'

class Portfolio::Server < Sinatra::Base
  set :root, File.dirname(__FILE__)+'/../..'
  set :views, File.dirname(__FILE__)+'/views'

  before do
    @data = Portfolio::Data.new
    @categories = @data.categories
  end

  get '/' do
    @photos = @data.photos
    slim :home
  end

  get '/:id' do
    @photo = @data.find_photo_by_id(params[:id])
    @title = @photo.title
    slim :photo
  end

  get '/category/:slug' do
    @category = @data.find_category_by_slug(params[:slug])
    @title = @category.title
    @photos = @data.find_photos_by_category @category.title
    slim :category
  end
end
