class TabsController <  ApplicationController

  # all tabs
  get '/tabs' do
    binding.pry

    #if logged_in?
      # ^^ NOT logged in so cant uncomment
      @tabs = Tab.all

      # puts session[:user_id] #test
      # puts "above is inside tabs session[:user_id]" #test
      puts current_user

      #binding.pry
      erb :'tabs/index'

    #else
      #redirect to '/signup'
    #end
  end

  get '/tabs/new' do
    @tab = Tab.new
    erb :'/tabs/new'
  end

  post '/tabs/:id' do

  end

end
