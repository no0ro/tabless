class UsersController <  ApplicationController

#-------------signup----------------#
  # renders form to create new user
  get '/signup' do
    erb :'users/signup'
  end

#gets the new user's info from the params hash, creates a new user,
#signs them in, and then redirects them to login
  post '/signup' do
    user = User.new(:name => params["name"], :email => params["email"], :password => params["password"])

    if user.save
      redirect "/login"
    else
      erb :'users/signup'
    end
  end

  #-------------login----------------#
  get '/login' do
    erb :'users/login'
  end

#grabs the user's info from the params hash,
#looks to match that info against the existing entries in the user db
# and, if a matching entry is found, signs the user in.
  post '/login' do
    # does this user exist in the db?
    user = User.find_by(:name => params["name"]) #in name column, return params key name's value

    if user && user.authenticate(params["password"]) #if pswd matches && if user exits in db
      session[:user_id] = user.id # set session to this user
      erb :'tabs/index'
    else
      erb :welcome
    end
  end




end
