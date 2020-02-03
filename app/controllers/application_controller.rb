require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "password_security"
  end

  # renders links to signup or login
  get "/" do
    erb :index
  end

  helpers do
    # checks if user is logged in
    def logged_in?
      if session[:user_id] != nil
      end 
    end

    # keeps track of the user currently logged in
    def current_user
      User.find(session[:user_id])
    end
  end

end
