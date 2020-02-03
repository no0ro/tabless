class UsersController <  ApplicationController

#-------------signup----------------#
  # renders form to create new user
  get '/signup' do
    if logged_in?
      #redirect '/index'
      erb :'tabs/index'
      # review ^^
      # change to index route so i have a change to validate user
    else
      erb :'users/signup'
    end
  end

#gets the new user's info from the params hash, creates a new user,
#signs them in, and then redirects them to login
  post '/signup' do
    # if username is already taken
        # tell user to choose another name
        # redirect "/signup" # aka refresh the page
    if User.find_by(:name => params["name"])
      puts "Choose another name, that one is taken."
      redirect "/signup" # aka refresh the page

    else
      # create a new user with the user input
      user = User.new(:name => params["name"], :email => params["email"], :password => params["password"])

      if user.save  # if user clicks submit
        session[:user_id] = user.id # log the user in
        erb :'tabs/index'
        # change to index route so i have a change to validate user
      else
        redirect "/signup" # aka refresh the page
      end
    end
  end



  #-------------login----------------#
  get '/login' do
    if logged_in?
      erb :'tabs/index' #login view
      # change to index route so i have a change to validate user
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
      erb :'tabs/index' # change to index route so i have a change to validate user
    else
      puts "Wrong login info"
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

#-------------show????----------------#
# get '/show/:id' do
#   erb :'tabs/show'
# end


end
