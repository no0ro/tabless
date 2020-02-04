class UsersController <  ApplicationController

#-------------signup----------------#
  # renders form to create new user
  get '/signup' do
    if logged_in? #if there is an active session matching user.id && session_id
      redirect '/tabs'
    else
      erb :'users/signup'
    end
  end

#gets the new user's info from the params hash, creates a new user,signs them in, and then redirects them to login
  post '/signup' do
    # [TO DO] if username is already taken > tell user to choose another name > redirect "/signup" # aka refresh the page
    if User.find_by(:name => params["name"]) #look in db and check if name already exists
      puts "Choose another name, that one is taken."
      redirect to "/signup" # aka refresh the page
      #^^ "to" necessary? google.

    else # create a new user with the user input
      user = User.create(:name => params["name"], :email => params["email"], :password => params["password"])

      #if @user.save  # if user clicks submit
        # puts user.id  #22 #testing
        # puts session #<Rack::Session::... #testing
        # puts session[:user_id] #empty at this point #testing

      session[:user_id] = user.id # log the user in. set the users ID to equal the session ID
        # puts session[:user_id]  #22 ...success set session! #testing
        # @current_session = session[:user_id] #testing if saved
        # binding.pry
      redirect_to_homepage #aka /tabs
      #else
        #redirect "/signup" # aka refresh the page
      #end
    end
  end

  #-------------login----------------#
  get '/login' do
    if logged_in?
      redirect '/tabs' #login view
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
      redirect "/tabs" # change to index route so i have a change to validate user
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



#-----------------------------#
# get '/show/:id' do
#   erb :'tabs/show'
# end


end
