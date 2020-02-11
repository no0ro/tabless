require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
    use Rack::Flash

  end

  # renders routes to signup & login pages
  get "/" do
    erb :index
  end

  helpers do
    # checks if user is logged in
    # if there is an active session matching user.id && session_id
    def logged_in?
      session[:user_id] != nil
    end

    # keeps track of the user currently logged in
    def current_user
      User.find(session[:user_id])
    end

    def redirect_to_homepage
      redirect to "/tabs"
    end
  end

end
