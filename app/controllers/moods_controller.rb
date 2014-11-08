class MoodsController < ApplicationController
  def new
  end

  def set_sessions_mood 
    session[:mood] = params[:mood]
    podcasts = Podcast.where("genre = ?",params[:mood])
    redirect_to podcast_path(podcasts.first)
  end
end
