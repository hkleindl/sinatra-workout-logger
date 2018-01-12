require './config/environment'
require 'rack-flash'


class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "workout_log_secret"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end

    def username_taken?
      !!User.find_by(username: params[:user][:username])
    end

    def email_taken?
      !!User.find_by(email: params[:user][:email])
    end
  end

  def redirect_if_not_logged_in
    flash[:message] = "You must be logged in to view page."
    redirect '/'
  end

  def current_workout
    @current_workout = current_user.workouts.find_by(id: session[:workout_id])
  end

end
