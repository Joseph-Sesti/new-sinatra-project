class VideogameSystemsController < ApplicationController

  get '/systems' do
    # redirect_if_not_logged_in
    @user = current_user
    erb :'systems/index'
  end

  get '/systems/new' do
    @user = current_user
    erb :'systems/new'
  end

  post '/systems/new' do
    @system = VideogameSystem.create(:name => params[:name],
      :release_date => params[:release_date],
      :manufacturer => params[:manufacturer])
      @system.user = current_user
      @system.save
    redirect to "/systems/#{@system.id}"
  end

  get '/systems/:id' do
    # redirect_if_not_logged_in
    @system = VideogameSystem.find_by_id(params[:id])
    erb :'systems/show'
  end

  get '/systems/:id/edit' do
    @user = current_user
    @system = VideogameSystem.find_by_id(params[:id])
    erb :'systems/edit'
  end

  patch '/systems/:id' do
    @system = VideogameSystem.find_by_id(params[:id])
    @system.name = params[:name]
    @system.release_date = params[:release_date]
    @system.manufacturer = params[:manufacturer]
    @system.user = current_user
    @system.save
    redirect to "/systems/#{@system.id}"
  end

  delete '/systems/:id' do
    system = VideogameSystem.find_by_id(params[:id])
    system.delete
    redirect to '/systems'
  end
end
