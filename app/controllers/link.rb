require 'sinatra/base'

module Sinatra
  module LinkController
    def self.registered(app)
      app.get '/links/new' do
        haml :'links/new'
      end

      app.post '/links' do
        url = params['url']
        title = params['title']
        tags = params['tags'].split(' ').map do |tag|
          Tag.first_or_create(text: tag)
        end
        Link.create(url: url, title: title, tags: tags)
        redirect to '/'
      end
    end
  end
end