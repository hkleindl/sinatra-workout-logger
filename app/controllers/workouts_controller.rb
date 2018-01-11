class WorkoutsController < ApplicationController

  get '/workouts' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'/workouts/index'
    else
      redirect_if_not_logged_in
    end
  end

  get '/workouts/new' do
    if logged_in?
      erb :'/workouts/new'
    else
      redirect_if_not_logged_in
    end
  end

  post '/workouts/new' do
    if !params[:workout][:date].empty?
      @workout = Workout.create(params[:workout])
      redirect '/workouts'
    end
  end

  get '/workouts/:id' do
    if logged_in?
      @workout = Workout.find_by(id: params[:id])
      erb :'/workouts/show'
    else
      redirect_if_not_logged_in
    end
  end

  get '/workouts/:id/edit' do
    if logged_in?
      @workout = Workout.find_by(id: params[:id])
      erb :'/workouts/edit'
    else
      redirect_if_not_logged_in
    end
  end

  post '/workouts/:id/edit' do
    @workout = Workout.find_by(id: params[:id])
    @workout.notes = params[:notes]
    @workout.save
    redirect "/workouts/#{@workout.id}"
  end

  post '/workouts/:id/delete' do
    @workout = Workout.find_by(id: params[:id])
    @workout.destroy
    redirect '/workouts'
  end


end
