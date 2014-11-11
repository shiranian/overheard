class Podcast < ActiveRecord::Base
  has_attached_file :cover, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "http://placehold.it/50x50"
    validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
    acts_as_taggable
  def next
    Podcast.where("genre = ? AND id > ?", self.genre, self.id).take || Podcast.where("genre = ?", self.genre).first
  end
end
