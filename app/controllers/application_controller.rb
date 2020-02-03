require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "pswd"
  end

  get "/" do
    erb :index
  end

  # get "/hey" do
  #   session["name"] = "Noelle"
  #   @session = session
  #   erb :welcome
  # end

end
