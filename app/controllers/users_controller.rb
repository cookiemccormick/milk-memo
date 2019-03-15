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
    if User.username_taken?(params[:user][:username])
      flash[:message] = "Your username is taken."
      redirect '/signup'
    elsif params[:user][:username].present? &&
      params[:user][:password].present? &&
      params[:user][:email].present? &&
      params[:baby][:due_date].present?

      @user = User.create(params[:user])
      @user.create_baby(params[:baby].merge(gender: Baby::UNKNOWN))
      session[:user_id] = @user.id
      redirect '/dashboard'
    else
      flash[:message] = "Please enter content for all fields."
      redirect '/signup'
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
      @baby = current_user.baby

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