class FiguresController < ApplicationController

  get '/figures' do 
    @figures = Figure.all 
    erb :'figures/index'
  end

  get '/figures/new' do 
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find_by_id(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  post '/figures' do 
    @figure = Figure.create(params["figure"])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params["figure"])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  # patch '/songs/:slug' do
  #   @song = Song.find_by_slug(params[:slug])
  #   @song.update(name: params[:song])
  #   @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
  #   @song.save

  #   flash[:message] = "Successfully updated song."
  #   redirect("/songs/#{@song.slug}")
  # end

end