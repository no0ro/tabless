# require 'rack-flash'
class UsersController <  ApplicationController

#-------------signup----------------#
  # renders form to create new user OR redirect active user /tabs route
  get '/signup' do
    if logged_in?
      redirect_to_homepage # '/tabs route'
    else
      erb :'users/signup' # create new user
    end
  end

  # gets the new user's info from the params hash, creates a new user,signs them in, and then redirects them to login
  post '/signup' do

    if User.find_by(:name => params["name"]) # look in db and check if name already exists
      flash[:message] = "Username is taken. Choose a different username."
      redirect to "/signup"

    else
      # 1) take user input & create a new user
      user = User.new(:name => params["name"], :email => params["email"], :password => params["password"])
      if user.save
        # 2) log the user in. set the users ID to equal the session ID
        session[:user_id] = user.id
        # 3)"/tabs" route
        redirect_to_homepage
      else
        flash[:message] = "Please enter a valid username, email, and password."
        redirect to '/signup'
      end
    end
  end

  #-------------login----------------#
  get '/login' do
    if logged_in?
      redirect_to_homepage
    else
      erb :'users/login'
    end
  end

#grabs the user's info from the params hash,
#looks to match that info against the existing entries in the user db
# and, if a matching entry is found, signs the user in.
  post '/login' do
    # does this username exist in the db?
    user = User.find_by(:name => params["name"]) #in name column, return params key, name's, value

    if user && user.authenticate(params["password"]) # if pswd matches && if user exits in db
      session[:user_id] = user.id # set session to this user
      redirect_to_homepage # go to '/tabs' route
    else
      flash[:message] = "Incorrect log in information. Please try again."
      redirect to '/login' # refresh page
    end
  end


  #-------------logout----------------#
  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    end
  end
  
end
