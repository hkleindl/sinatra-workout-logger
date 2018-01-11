class ExercisesController < ActiveRecord

  get '/exercises' do
    if logged_in?
      erb :'/exercises/index'
    else
      redirect_if_not_logged_in
    end
  end
end
