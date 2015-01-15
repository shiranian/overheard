class PodcastsController < ApplicationController
  before_filter :get_podcast_and_set_author_state, only: [:show]
  def index
    @podcasts = Podcast.where("genre = ?", params[:category]) || @podcast = Podcast.all
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

  def edit
    @podcast = Podcast.find(params[:id])
  end

  def update
    @podcast = Podcast.find(params[:id])
    if @podcast.update(podcast_params)
      redirect_to @podcast
    else
      render "edit"
    end
  end

  def show
    @authors = @author_state.authors
  end

  private
  def podcast_params 
    params.require(:podcast).permit(:title, :author, :genre, :length, :cover, :tag_list, :audio)
  end

  def get_podcast_and_set_author_state
    @podcast = Podcast.find(params[:id])
    @author_state = AuthorState.new(session)
    @author_state.push(@podcast.author)
  end
end
