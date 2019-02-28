class BabiesController < ApplicationController
  get '/babies/new' do
    if logged_in?
      erb :'/babies/new'
    else
      redirect '/login'
    end
  end

  post '/babies' do
    if logged_in?
      if params[:baby][:name].present? ||
        params[:baby][:gender].present?
        @baby = current_user.babies.create(params[:user])
        @baby.create_baby(params[:baby].merge(due_date))
        redirect '/dashboard'
      else
        redirect '/babies/new'
      end
    else
      redirect '/login'
    end
  end
end