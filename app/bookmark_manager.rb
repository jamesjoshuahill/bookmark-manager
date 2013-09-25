require 'sinatra/base'
require 'haml'
require 'rack-flash'
require 'data_mapper'
require './lib/link'
require './lib/tag'
require './lib/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  set :sessions, true
  set :session_secret, 'Supercalifragilisticexpialidocious'
  use Rack::Flash
  helpers ApplicationHelpers

  get '/' do
    @links = Link.all
    haml :index
  end

  get '/users/new' do
    @user = User.new
    haml :'users/new'
  end

  get '/tags/:text' do
    tag = Tag.first(text: params[:text])
    @links = tag ? tag.links : []
    haml :index
  end

  post '/users' do
    @user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      haml :'users/new'
    end
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