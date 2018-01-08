class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if !params[:user].values.any?(&:empty?)
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      redirect '/signup'
    end
  end

end
