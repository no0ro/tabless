class TabsController <  ApplicationController

  # all tabs
  get '/tabs' do
    #binding.pry
    if logged_in?
      @user = current_user
      @tabs = Tab.where("user_id" => @user.id)
      # puts session[:user_id] #test
      # puts "above is inside tabs session[:user_id]" #test
      erb :'tabs/index'
    else
      redirect to '/signup'
    end
  end

  #new
  get '/tabs/new' do
    @tab = Tab.new
    erb :'/tabs/new'
  end

  #create
  post '/tabs' do
    user = current_user
    tab = Tab.create(:name => params["tab_name"], :url => params["url"], :notes => params["notes"])
    

  end

  #show
  post '/tabs/:id' do

  end

end
