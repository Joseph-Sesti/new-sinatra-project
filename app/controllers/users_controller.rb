class UserController < ApplicationController
  get '/users/:id' do
    if !logged_in?
      redirect '/systems'
    end

  post '/users/:id'
    @user = User.find(:username => params[:username], password_digest => params[:password_digest])
    if !@user.nil? && @user == current_user
      erb :users/show
    else
      redirect '/systems'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/'
    else
      redirect to '/login'
    end
  end
end
