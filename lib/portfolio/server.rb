$: << File.dirname(__FILE__)+'/..'

require 'sinatra/base'
require 'slim'
require 'portfolio/portfolio'

module Portfolio
  class Server < Sinatra::Base
    set :root, File.dirname(__FILE__)+'/../..'
    set :views, File.dirname(__FILE__)+'/views'

    before do
      @portfolio = Portfolio.new
      @categories = @portfolio.categories
    end

    get '/' do
      @photos = @portfolio.photos
      slim :home
    end

    get '/:id' do
      @photo = @portfolio.find_photo_by_id(params[:id])
      @title = @photo.title
      slim :photo
    end

    get '/category/:slug' do
      @category = @portfolio.find_category_by_slug(params[:slug])
      @title = @category.title
      @photos = @portfolio.find_photos_by_category @category.title
      slim :category
    end
  end
end
