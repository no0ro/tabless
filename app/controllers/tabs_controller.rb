class TabsController <  ApplicationController

  get '/tabs' do

    # session[:user_id]
    @user = User.find(session[:user_id])
    binding.pry
    erb :'tabs/index'
  end

end
