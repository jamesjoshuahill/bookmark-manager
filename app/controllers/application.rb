require 'sinatra/base'

module Sinatra
  module ApplicationController
    def self.registered(app)
      app.get '/' do
        @links = Link.all
        haml :index
      end
    end
  end
end