class WorkoutsController < ApplicationController

  get '/workouts' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'/workouts/index'
    else
      # flash[:message] = "You must be logged in to view page."
      # redirect '/'
      redirect_if_not_logged_in
    end
  end

  get '/workouts/new' do
    if logged_in?
      erb :'/workouts/new'
    else
      # flash[:message] = "You must be logged in to view page."
      # redirect '/'
      redirect_if_not_logged_in
    end
  end



end
