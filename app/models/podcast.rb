class Podcast < ActiveRecord::Base

  def next
    Podcast.where("genre = ? AND id > ?", self.genre, self.id).take || Podcast.where("genre = ?", self.genre).first
  end
end
