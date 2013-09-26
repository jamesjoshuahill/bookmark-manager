require 'sinatra/base'

module Sinatra
  module ApplicationHelpers
    def current_user    
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  helpers ApplicationHelpers
end