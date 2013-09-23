require 'sinatra/base'
require 'haml'

class BookmarkManager < Sinatra::Base
  set :views, File.join(File.dirname(__FILE__), '..', 'views')

  get '/' do
    haml :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end