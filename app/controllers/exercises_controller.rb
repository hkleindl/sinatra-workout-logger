class ExercisesController < ApplicationController

  get '/exercises' do
    if logged_in?
      erb :'/exercises/index'
    else
      redirect_if_not_logged_in
    end
  end

  get '/exercises/cardio/new' do
    if logged_in?
      erb :'/exercises/cardio/new'
    else
      redirect_if_not_logged_in
    end
  end

  post '/exercises/cardio/new' do
    if !params[:cardio][:name].empty?
      @exercise = Exercise.create(params)
      redirect '/exercises/cardio/add'
    else
      flash[:message] = "Please fill out name field"
      redirect '/exercises/cardio/new'
    end
  end

  get '/exercises/cardio/add' do
    if logged_in?
      erb :'/exercises/cardio/add'
    else
      redirect_if_not_logged_in
    end
  end

  post '/exercises/cardio/add' do
    if !params[:cardio].any?(&:empty?)
      @exercise = Exerise.create(params[:cardio])
      redirect "/workouts/#{current_workout.id}"
    else
      flash[:message] = "Please fill out all forms"
      redirect '/exercises/cardio/add'
    end
  end

end
