require 'sinatra/base'
require 'haml'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'

DataMapper.finalize
DataMapper.auto_upgrade!


class BookmarkManager < Sinatra::Base
  set :views, File.join(File.dirname(__FILE__), '..', 'views')

  get '/' do
    haml :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end