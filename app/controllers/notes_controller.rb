class NotesController < ApplicationController
  get '/notes/new' do
    if logged_in?
      erb :'/notes/new'
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  post '/notes' do
    if logged_in?
      if params[:note][:content].present?
        @note = current_user.notes.create(content: params[:note][:content])

        flash[:message] = "Your note has been added to the dashboard."
        redirect '/dashboard'
      else
        flash[:message] = "Please enter content."
        redirect '/notes/new'
      end
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  get '/notes/:id/edit' do
    if logged_in?
      @note = current_user.notes.find_by(id: params[:id])
      if @note
        erb :'/notes/edit'
      else
        flash[:message] = "Could not find note."
        redirect '/dashboard'
      end
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  patch '/notes/:id' do
    if logged_in?
      @note = current_user.notes.find_by(id: params[:id])
      if params[:note][:content].present?
        @note.update(params[:note])

        flash[:message] = "Your note has been updated."
        redirect '/dashboard'
      else
        flash[:message] = "Please enter content."
        redirect "/notes/#{@note.id}/edit"
      end
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  delete '/notes/:id' do
    if logged_in?
      @note = current_user.notes.find_by(id: params[:id])
      if @note
        @note.destroy
        flash[:message] = "Note deleted."
      end
      redirect '/dashboard'
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end
end