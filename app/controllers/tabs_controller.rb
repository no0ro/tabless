class TabsController <  ApplicationController

  # all tabs
  get '/tabs' do
    #binding.pry
    if logged_in?
      @user = current_user
      @tabs = current_user.tabs
      puts @tabs #["user_id", 38]
      puts "^@tabs"
      puts @user ##<User:0x00007fe5783543b8>
      puts "^@user"
      puts current_user #<User:0x00007fe57a01dc60>
      # puts session[:user_id] #test
      # puts "above is inside tabs session[:user_id]" #test
      #binding.pry
      erb :'tabs/index'
    else
      redirect to '/'
    end
  end

  # new - user can create a new tab  IF logged in
  get '/tabs/new' do
    #if logged_in?
    @tab = Tab.new
    erb :'/tabs/new'
  end

  #create
  post '/tabs' do
    #binding.pry
    tab = Tab.new(:name => params["tab_name"], :url => params["url"], :notes => params["notes"])
    tab.user_id = current_user.id
    tab.save
    #binding.pry
    redirect_to_homepage
  end

  #show
  get '/tabs/:id' do
    if logged_in?
        #binding.pry
        @tab = Tab.find_by_id(params[:id])
        if @tab.user == current_user #make sure pulling up only this user's saved tab. not someone elses saved tab
          erb :'tabs/show'
        else
          redirect to '/login'
        end
    else
      redirect_to_homepage
    end
  end

  #edit
  get '/tabs/:id/edit' do
    if logged_in?
      @tab = Tab.find_by_id(params[:id])
      if @tab.user == current_user #make sure pulling up only this user's saved tab. not someone elses saved tab
        erb :'tabs/edit'
      else
        redirect to '/login'
      end
    else
      redirect_to_homepage
    end
  end

  #update
  patch '/tabs/:id' do

    @tab = Tab.find_by_id(params[:id])
    if @tab.user == current_user
      @tab.update(:name => params["name"], :url => params["url"], :notes => params["notes"])
      @tab.save
      redirect "/tabs/#{@tab.id}"
    else
      redirect "/"
    end

  end

  #delete
  delete '/tabs/:id' do

  end

end
