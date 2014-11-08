   n = 0
   5.times do
   n += 1
   podcast = Podcast.create(title: "example" + n.to_s, author: "author " + n.to_s, genre: "economics")
   podcast = Podcast.create(title: "example" + n.to_s, author: "author " + n.to_s, genre: "surfing")
   podcast = Podcast.create(title: "example" + n.to_s, author: "author " + n.to_s, genre: "psychology")
   podcast = Podcast.create(title: "example" + n.to_s, author: "author " + n.to_s, genre: "boobs")
   podcast = Podcast.create(title: "example" + n.to_s, author: "author " + n.to_s, genre: "technology")
   end
