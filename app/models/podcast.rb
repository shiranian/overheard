class Podcast < ActiveRecord::Base
  has_attached_file :cover, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "http://placehold.it/50x50", :storage => :s3,
    :bucket => ENV['s3_bucket_name'],
    :s3_credentials => {
      :access_key_id => ENV['aws_access_key_id'],
      :secret_access_key => ENV['aws_secret_key_id']
  },
  :url =>':s3_domain_url',
  :path => '/:class/:attachment/:id_partition/:style/:filename'

has_attached_file :audio, :storage => :s3,
    :bucket => ENV['s3_bucket_name'],
    :s3_credentials => {
      :access_key_id => ENV['aws_access_key_id'],
      :secret_access_key => ENV['aws_secret_key_id']
  },
  :url =>':s3_domain_url',
  :path => '/:class/:attachment/:id_partition/:style/:filename'
  
  validates_attachment :audio, content_type: { :content_type => ["audio/mpeg", "audio/mp3"] }
  
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
   acts_as_taggable
  
   def next
    Podcast.where("genre = ? AND id > ?", self.genre, self.id).take || Podcast.where("genre = ?", self.genre).first
  end
end
