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
      @exercise = Exercise.create(params[:cardio])
      @exercise.category = 'cardio'
      @exercise.save
      current_user.exercises << @exercise
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
    if !params[:cardio].values.any?(&:empty?)
      @exercise = Exercise.create(params[:cardio])
      @workout = Workout.find_by(id: session[:workout_id])
      @exercise.workout_id = @workout.id
      @workout.exercises << @exercise
      redirect "/workouts/#{current_workout.id}"
    else
      flash[:message] = "Please fill out all forms"
      redirect '/exercises/cardio/add'
    end
  end

  get '/exercises/resistance/add' do
    if logged_in?
      erb :'/exercises/resistance/add'
    else
      redirect_if_not_logged_in
    end
  end

  post '/exercises/resistance/add' do
    if !params[:resistance].values.any?(&:empty?)
      @exercise = Exercise.create(params[:resistance])
      @workout = Workout.find_by(id: session[:workout_id])
      @exercise.workout_id = @workout.id
      @workout.exercises << @exercise
      redirect "/workouts/#{current_workout.id}"
    else
      flash[:message] = "Please fill out all forms"
      redirect '/exercises/resistance/add'
    end
  end

  get '/exercises/resistance/new' do
    if logged_in?
      erb :'/exercises/resistance/new'
    else
      redirect_if_not_logged_in
    end
  end


end
