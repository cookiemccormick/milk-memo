class NotesController < ApplicationController
  get '/notes/new' do
    if logged_in?
      erb :'/notes/new'
    else
      redirect '/login'
    end
  end

  post '/notes' do
    if logged_in?
      if params[:note][:content].present?
        @note = current_user.notes.create(content: params[:note][:content])
        redirect '/dashboard'
      else
        redirect '/notes/new'
      end
    else
      redirect '/login'
    end
  end

  get '/notes/:id/edit' do
    if logged_in?
      @note = current_user.notes.find_by(id: params[:id])
      if @note
        erb :'/notes/edit'
      else
        redirect '/dashboard'
      end
    else
      redirect '/login'
    end
  end

  patch '/notes/:id' do
    if logged_in?
      @note = current_user.notes.find_by(id: params[:id])
      if params[:note][:content].present?
        @note.update(content: params[:note][:content])
        redirect '/dashboard'
      else
        redirect "/notes/#{@note.id}/edit"
      end
    else
      redirect '/login'
    end
  end
end