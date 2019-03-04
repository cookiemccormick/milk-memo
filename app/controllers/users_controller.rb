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

      flash[:message] = "Please enter content for all fields."
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
      flash[:message] = "Your username or password could not be identified.  Please sign up."
      redirect '/signup'
    end
  end

  get '/dashboard' do
    if logged_in?
      @birth_count = (current_user.baby.due_date - Date.today).to_i
      @baby = current_user.baby

      weeks_left = @birth_count / 7
      @weeks = 40 - weeks_left

      erb :'/users/dashboard'
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end