class VideogamesController < ApplicationController

  get '/videogames' do
    # redirect_if_not_logged_in
    @user = current_user
    erb :'videogames/index'
  end

  get '/videogames/new' do
    @user = current_user
    erb :'videogames/new'
  end

  post '/videogames/new' do
    @videogame = Videogame.create(:title => params[:title],
      :system => params[:system],
      :publisher => params[:publisher],
      :release_date => params[:release_date])
      @videogame.user = current_user
      @videogame.save
    redirect to "/videogames/#{@videogame.id}"
  end

  get '/videogames/:id' do
    @videogame = Videogame.find_by_id(params[:id])
    erb :'videogames/show'
  end

  get '/videogames/:id/edit' do
    @videogame = Videogame.find_by_id(params[:id])
    if @videogame.user != current_user
      redirect "/account"
    else
      erb :'videogames/edit'
    end
  end

  patch '/videogames/:id' do
    @videogame = Videogame.find_by_id(params[:id])
    @videogame.title = params[:title]
    @videogame.system = params[:system]
    @videogame.publisher = params[:publisher]
    @videogame.release_date = params[:release_date]
    @videogame.save
    redirect to "/videogames/#{@videogame.id}"
  end

  delete '/videogames/:id' do
    videogame = Videogame.find_by_id(params[:id])
    videogame.delete
    redirect to '/videogames'
  end
end
