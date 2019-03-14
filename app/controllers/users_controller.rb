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
    @user = User.new(params[:user])
    baby = @user.build_baby(params[:baby].merge(gender: Baby::UNKNOWN))
    @user.validate
    baby.validate

    if @user.valid? && baby.valid?
      @user.save
      baby.save
      session[:user_id] = @user.id
      redirect '/dashboard'
    else
      errors = @user.errors.full_messages + baby.errors.full_messages
      flash[:message] = errors.join(', ')
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