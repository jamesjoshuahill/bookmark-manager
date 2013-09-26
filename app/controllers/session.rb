require 'sinatra/base'

module Sinatra
  module SessionController
    def self.registered(app)
      app.get '/sessions/new' do
        haml :'sessions/new'
      end

      app.post '/sessions' do
        email, password = params[:email], params[:password]
        user = User.authenticate(email, password)
        if user
          session[:user_id] = user.id
          redirect to '/'
        else
          flash[:errors] = ["The email or password are incorrect"]
          haml :'sessions/new'
        end
      end

      app.delete '/sessions' do
        flash[:notice] = 'Goodbye!'
        session[:user_id] = nil
        redirect to '/'
      end
    end
  end
end