class LandmarksController < ApplicationController
  
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do 
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks' do 
    @landmark = Landmark.new
    @landmark.name = params[:name]
    @landmark.year_completed = params[:year_completed]
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end 

  patch '/landmarks/:id/edit' do 
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end


end
