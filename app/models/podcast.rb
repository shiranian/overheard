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

  has_many :ratings
  
  validates_attachment :audio, content_type: { :content_type => ["audio/mpeg", "audio/mp3"] }
  
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
   acts_as_taggable

  GENRES = %w(classics learning\ corner news\ outlook storytelling people\ &\ ideas experimental)  
  MOODS = %w(happy sad indifferent)
  
   def next
     Podcast.where("genre = ? AND id > ?", self.genre, self.id).take || Podcast.where("genre = ?", self.genre).first
   end

   
   def next_similar_podcast(authors)
     podcasts = Podcast.includes(:tags).where("id != ?", self.id) #change this to only query for podcasts with similar genre to improve efficiency
     podcasts.each do |podcast|
      return podcast if has_n_or_more_tags(3, podcast) && has_similar_mood(podcast) && !authors.include?(podcast.author)
     end 
    random_podcast 
   end
    
   def has_similar_mood(next_podcast) #boolean to check if current podcast and podcast passed in as argument have similar mood
     if self.mood ==  'sad'
       return next_podcast.mood == 'indifferent' || next_podcast.mood = self.mood 
     elsif self.mood == 'happy'
       return next_podcast.mood == 'indifferent' || next_podcast.mood == self.mood 
    else
      return next_podcast.mood == 'happy' || next_podcast.mood == 'sad' || next_podcast.mood == self.mood
    end
   end

   def random_podcast
    podcasts = Podcast.where("genre = ?", self.genre)
    podcasts_collection = podcasts.to_a
    random_podcast_id = self.id# sets it initally to same id to make while condition true
    
    while self.id == random_podcast_id do   #makes sure it doesn't return same id as current podcast
      random_podcast_id = Random.new.rand(podcasts_collection.length)
    end
     podcasts_collection[random_podcast_id]
   end

   def has_n_or_more_tags(n, podcast)
    num_tags = 0
    self.tag_list.each do |tag|
      if(podcast.tag_list.include?(tag))
         num_tags +=1
      end
    end
    num_tags >= n 
   end

   def average_rating
     num_ratings = self.ratings.count.to_f || 0
     num_stars = 0.0
     self.ratings.each do |rating|
       num_stars += rating.stars
     end
     average = (num_stars / num_ratings)
   end
end
