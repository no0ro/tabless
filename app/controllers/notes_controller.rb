class NotesController <  ApplicationController

  # index
  get '/notes' do
    if logged_in?
      @user = current_user
      @notes = current_user.notes
      erb :'notes/index'
    else
      redirect to '/'
    end
  end


  # new
  get '/notes/new' do
    if logged_in?
      erb :'notes/new'
    else
      redirect to '/'
    end
  end

  # create
  post '/notes' do
    if logged_in?
      note = Note.new(:name => params["note_name"])
      note.user_id = current_user.id
      note.save
      redirect_to_notes_homepage
    else
      redirect to '/'
    end
  end

  # show
  get '/notes/:id' do
    if logged_in?
      # pull up note instance
      @note = Note.find_by_id(params["id"])
      if @note.user == current_user

        erb :'notes/show'
      else
        redirect_to_notes_homepage
      end
    else
      redirect to '/'
    end
  end

  # delete
  delete '/notes/:id' do
    if logged_in?
      @note = Note.find_by_id(params[:id])
      if @note.user == current_user # validate that this @note belongs to this user
        @note.delete
        redirect_to_notes_homepage
      end
    else
      redirect to '/'
    end
  end



end
