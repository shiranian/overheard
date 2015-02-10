class MoodsController < ApplicationController
  def new
  end

  def set_sessions_mood 
    session[:mood] = params[:mood]
    podcasts = Podcast.where("genre = ?",params[:mood])
    num_podcasts = podcasts.length
    redirect_to podcast_path(podcasts[rand(num_podcasts)])
  end
end
