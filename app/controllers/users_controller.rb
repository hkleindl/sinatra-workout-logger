class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/new_user'
  end

  get '/login' do
    erb :'/users/login'
  end



end
