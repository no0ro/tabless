class TabsController <  ApplicationController

  # all tabs
  get '/tabs' do
    if logged_in?
      @user = current_user
      @tabs = current_user.tabs
      erb :'tabs/index'
    else
      redirect to '/'
    end
  end

  # new - renders new tab form IF user is logged in
  get '/tabs/new' do
    if logged_in?
      erb :'/tabs/new'
    else
      redirect to '/'
    end
  end

  # create
  post '/tabs' do
    if logged_in?
      # 1) take user input & create a new tab
      tab = Tab.new(:name => params["tab_name"], :url => params["url"], :notes => params["notes"])

      # 2) assign the user's id #, to the tabs user_id key
      # aka associate the tab to the user
      tab.user_id = current_user.id

      tab.save
      redirect_to_homepage
    else
      redirect to '/'
    end
  end

  # show
  get '/tabs/:id' do
    if logged_in?
        @tab = Tab.find_by_id(params[:id])
        #@tab = current_tab
        if @tab.user == current_user #make sure pulling up only this user's saved tab. not someone elses saved tab
          erb :'/tabs/show'
        else
          redirect_to_homepage
        end
    else
      redirect to '/login'
    end
  end

  #edit
  get '/tabs/:id/edit' do
    if logged_in?
      @tab = Tab.find_by_id(params[:id])
      if @tab.user == current_user # make sure pulling up only this user's saved tab. not someone elses saved tab
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
    @tab = Tab.find_by_id(params[:id])
    if @tab.user == current_user
      @tab.delete
      redirect_to_homepage
    end
  end

end
