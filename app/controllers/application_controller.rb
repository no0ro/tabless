require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "password_security"
    #3ENV["SESSION_SECRET"]

  end

  # renders links to signup/login
  get "/" do
    erb :index
  end

  helpers do
    # checks if user is logged in
    def logged_in?
      session[:user_id] != nil
    end

    # keeps track of the user currently logged in
    def current_user
      User.find(params["id"])
      #User.find(session[:user_id])
    end

    def redirect_to_homepage
      redirect to "/tabs"
    end
  end

end
