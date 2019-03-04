class BabiesController < ApplicationController
  get '/baby/edit' do
    if logged_in?
      @baby = current_user.baby
      erb :'/baby/edit'
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  patch '/baby' do
    if logged_in?
      @baby = current_user.baby
      if params[:baby][:name].present? &&
        params[:baby][:due_date].present? &&
        params[:baby][:gender].present?
        @baby.update(params[:baby])

        flash[:message] = "Your baby has been updated."
        redirect '/dashboard'
      else
        flash[:message] = "Please enter content for all fields."
        redirect "/baby/edit"
      end
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end
end