class UsersController < ApplicationController
  get '/signup' do
    if logged_in?
      redirect '/dashboard'
    else
      erb :'/users/create_user'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/dashboard'
    else
      erb :'/users/login'
    end
  end

  post '/signup' do
    if params[:user][:username].blank? ||
      params[:user][:password].blank? ||
      params[:user][:email].blank? ||
      params[:baby][:due_date].blank?
      redirect '/signup'
    else
      @user = User.create(params[:user])
      @user.create_baby(params[:baby].merge(gender: Baby::UNKNOWN))
      session[:user_id] = @user.id
      redirect '/dashboard'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/dashboard'
    else
      redirect '/signup'
    end
  end

  get '/dashboard' do
    if logged_in?
      @birth_count = ((current_user.baby.due_date - Time.now) / 86400).ceil

      erb :'/users/dashboard'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end
end