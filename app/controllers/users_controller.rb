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
      user = User.create(:name => params["name"], :email => params["email"], :password => params["password"])
      #User.new
      # if user.save

      session[:user_id] = user.id # 2) log the user in. set the users ID to equal the session ID
      redirect_to_homepage # 3)"/tabs" route
      # else
      # flash[:message] = "Please enter valid username, password, email"
      # rerender this page
      # end
    end
  end

  #-------------login----------------#
  get '/login' do
    if logged_in?
      redirect_to_homepage
      # change to index route so i have a chance to validate user
    else
      erb :'users/login'
    end
  end

#grabs the user's info from the params hash,
#looks to match that info against the existing entries in the user db
# and, if a matching entry is found, signs the user in.
  post '/login' do
    # does this user exist in the db?
    user = User.find_by(:name => params["name"]) #in name column, return params key name's value

    if user && user.authenticate(params["password"]) #if pswd matches && if user exits in db
      session[:user_id] = user.id # set session to this user
      redirect_to_homepage # change to index route so i have a change to validate user
    else
      puts "Wrong login info"
      # flash.alert = "Wrong login info"
      flash[:message] = "Incorrect Log In information"
      redirect '/login' # refresh page
    end
  end

#-------------logout----------------#
get '/logout' do
  if logged_in?
    session.clear
    redirect '/'
  end
end



#-----------------------------#
# get '/show/:id' do
#   erb :'tabs/show'
# end


end
