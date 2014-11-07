class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.find_by_genre(params[:category]) || @podcast = Podcast.all
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(podcast_params)

    if @podcast.save
      redirect_to podcast_path(@podcast)
    else
      redirect_to root_path
    end
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  private
  def podcast_params 
    params.require(:podcast).permit(:title, :integer, :author, :genre)
  end
end
