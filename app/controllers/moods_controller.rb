class MoodsController < ApplicationController
  def new
  end

  def set_sessions_mood 
    session[:mood] = params[:mood]
    redirect_to podcasts_path 
  end
end