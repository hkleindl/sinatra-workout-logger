class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/workouts'
    end
  end

  post '/signup' do
    #refactor?
    if !params[:user].values.any?(&:empty?)
      if !username_taken? && !email_taken?
        @user = User.create(params[:user])
        session[:user_id] = @user.id
        redirect '/workouts'
      elsif username_taken?
        flash[:message] = "That username is already taken. Please choose a new one"
        redirect '/signup'
      elsif email_taken?
        flash[:message] = "That email address is already being used."
        redirect '/signup'
      end
    else
      flash[:message] = "Please fill in all fields."
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/workouts'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/workouts'
    else
      flash[:message] = "Incorrect username or password"
      redirect '/login'
    end
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end
end
