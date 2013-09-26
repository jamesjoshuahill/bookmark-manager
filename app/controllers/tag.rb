require 'sinatra/base'

module Sinatra
  module TagController
    def self.registered(app)
      app.get '/tags/:text' do
        tag = Tag.first(text: params[:text])
        @links = tag ? tag.links : []
        haml :index
      end
    end
  end
end