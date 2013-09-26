require 'sinatra/base'

module Sinatra
  module IndexController
    def self.registered(app)
      app.get '/' do
        @links = Link.all
        haml :index
      end
    end
  end
end