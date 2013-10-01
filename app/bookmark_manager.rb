require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'
require 'haml'

require_relative 'controllers/application'
require_relative 'controllers/session'
require_relative 'controllers/link'
require_relative 'controllers/tag'
require_relative 'controllers/user'

require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

require_relative 'helpers/application'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  set :public_folder, 'public'
  set :sessions, true
  set :session_secret, 'Supercalifragilisticexpialidocious'
  use Rack::Flash
  use Rack::MethodOverride
  register Sinatra::Partial

  register Sinatra::ApplicationController
  register Sinatra::SessionController
  register Sinatra::UserController
  register Sinatra::LinkController
  register Sinatra::TagController  

  helpers Sinatra::ApplicationHelpers

  # start the server if ruby file executed directly
  run! if app_file == $0
end