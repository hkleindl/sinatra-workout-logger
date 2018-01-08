class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if !params[:user].values.any?(&:empty?)
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      redirect '/workouts'
    else
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
      redirect '/login'
    end
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end
end
