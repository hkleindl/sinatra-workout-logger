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
    if !current_user.exercises.find_by(name: params[:new_cardio][:name])

      if !params[:new_cardio].except(:description).values.any?(&:empty?)
        @exercise = Exercise.create(params[:new_cardio])
        current_user.exercises << @exercise
        current_workout.exercises << @exercise
        @exercise.workout = current_workout
        redirect "/workouts/#{current_workout.id}"
      else
        flash[:message] = "Please fill out all fields for choosing or creating an exercise"
        redirect '/exercises/cardio/add'
      end

    else
      flash[:message] = "That exercise already exists."
      redirect '/exercises/cardio/add'
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
      @exercise = current_user.exercises.find_by(name: params[:name])
      @exercise.update(params[:cardio])
      current_workout.exercises << @exercise
      @exercise.workout = current_workout
      redirect "/workouts/#{current_workout.id}"
    else
      flash[:message] = "Please fill out all fields for choosing or creating an exercise"
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
      @exercise = current_user.exercises.find_by(name: params[:name])
      @exercise.update(params[:resistance])
      current_workout.exercises << @exercise
      @exercise.workout = current_workout
      redirect "/workouts/#{current_workout.id}"
    else
      flash[:message] = "Please fill out all fields."
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

  post '/exercises/resistance/new' do
    if !current_user.exercises.find_by(name: params[:new_resistance][:name])

      if !params[:new_resistance].except(:description).values.any?(&:empty?)
        @exercise = Exercise.create(params[:new_resistance])
        current_user.exercises << @exercise
        current_workout.exercises << @exercise
        @exercise.workout = current_workout
        redirect "/workouts/#{current_workout.id}"
      else
        flash[:message] = "Please fill out all fields for choosing or creating an exercise"
        redirect '/exercises/resistance/add'
      end

    else
      flash[:message] = "That exercise already exists."
      redirect '/exercises/resistance/add'
    end
  end

  get '/exercises/:id/edit' do
    if logged_in?
      @exercise = current_workout.exercises.find_by(id: params[:id])
      erb :'/exercises/edit'
    else
      redirect_if_not_logged_in
    end
  end

  post '/exercises/:id/edit' do
    if !params[:exercise].except(:description).values.any?(&:empty?)
      @exercise = current_workout.exercises.find_by(id: params[:id])
      @exercise.update(params[:exercise])
      redirect "/workouts/#{current_workout.id}"
    else
      flash[:message] = "Please fill out fields. Description is optional."
      redirect "/exercises/#{params[:id]}/edit"
    end
  end

  post '/exercises/:id/delete' do
    @exercise = current_workout.exercises.find_by(id: params[:id])
    current_workout.exercises.delete(@exercise)
    redirect "/workouts/#{current_workout.id}"
  end

  post '/exercises/:id/delete-from-my-exercises' do
    @exercise = current_user.exercises.find_by(id: params[:id])
    current_user.exercises.delete(@exercise)
    redirect '/exercises'
  end

end
