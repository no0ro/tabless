class UsersController <  ApplicationController



#-------------signup----------------#
  # renders form to create new user
  get '/signup' do
    erb :'users/signup'
  end

#gets the new user's info from the params hash, creates a new user,
#signs them in, and then redirects them somewhere else
  post '/signup' do
    user = User.new(:name => params["name"], :email => params["email"], :password => params["password"])
    if user.save
      erb :'tabs/index'
    else
      erb :'users/login'
    end
  end

  #-------------login----------------#
  get '/login' do
    erb :'users/login'
  end

#grabs the user's info from the params hash,
#looks to match that info against the existing entries in the user db
# and, if a matching entry is found, signs the user in.
  post '/' do
  end




end
