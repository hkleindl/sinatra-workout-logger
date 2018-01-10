class WorkoutsController < ApplicationController

  get '/workouts' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'/workouts/index'
    else
      flash[:message] = "Log in or sign up to view page."
      redirect '/'
    end
  end

end
