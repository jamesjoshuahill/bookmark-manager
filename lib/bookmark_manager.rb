require 'sinatra/base'
require 'haml'
require 'data_mapper'
require './helpers/application'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require_relative 'link'
require_relative 'tag'
require_relative 'user'

DataMapper.finalize
DataMapper.auto_upgrade!

class BookmarkManager < Sinatra::Base
  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  set :sessions, true
  set :session_secret, 'Supercalifragilisticexpialidocious'
  
  helpers ApplicationHelpers

  get '/' do
    @links = Link.all
    haml :index
  end

  get '/users/new' do
    haml :"users/new"
  end

  get '/tags/:text' do
    tag = Tag.first(text: params[:text])
    @links = tag ? tag.links : []
    haml :index
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to '/'
  end

  post '/links' do
    url = params['url']
    title = params['title']
    tags = params['tags'].split(' ').map do |tag|
      Tag.first_or_create(text: tag)
    end
    Link.create(url: url, title: title, tags: tags)
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end