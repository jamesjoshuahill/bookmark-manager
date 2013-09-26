require 'sinatra/base'
require 'haml'
require 'rack-flash'
require 'data_mapper'
require_relative 'helpers/application'

require_relative 'controllers/index'
require_relative 'controllers/session'
require_relative 'controllers/link'
require_relative 'controllers/tag'
require_relative 'controllers/user'

require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  set :sessions, true
  set :session_secret, 'Supercalifragilisticexpialidocious'
  use Rack::Flash
  use Rack::MethodOverride
  helpers Sinatra::ApplicationHelpers
  register Sinatra::SessionController
  register Sinatra::IndexController
  register Sinatra::UserController
  register Sinatra::LinkController
  register Sinatra::TagController

  # start the server if ruby file executed directly
  run! if app_file == $0
end