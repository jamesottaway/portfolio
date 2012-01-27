require 'sinatra'

get '/' do
  'Main directory page'
end

get '/:id' do
  "Photo #{params[:id]}"
end
