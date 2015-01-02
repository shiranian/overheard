require "rails_helper"

describe Podcast do
   before(:all) do
      @podcast = build(:podcast)
      @podcast2 = build(:podcast)
      @podcast_with_diff_mood = build(:podcast)
      @podcast.tag_list.add("surf", "technology", "@podcast")
      @podcast2.tag_list.add("surf", "technology")
      @podcast_with_diff_mood.mood = "sad"
      @podcast.save!
      @podcast2.save!
      @podcast_with_diff_mood.save!
    end  
  describe "has_n_or_more_tags" do
    before do
      @podcast = create(:podcast, tag_list: ["surf", "technology", "podcast"])
      @podcast2 = create(:podcast, tag_list: ["surf", "technology"])
    end
    it "return true if @podcast in argument includes n number of tags of @podcast calling the method" do
      expect(@podcast.has_n_or_more_tags(2, @podcast2)).to eq(true)
    end

    it "returns false if @podcast in argument does not include n number of tags of @podcast calling the method" do
      expect(@podcast.has_n_or_more_tags(3, @podcast2)).to eq(false)
    end
  end

  describe "#has_similar_modd" do
    before do
      @happy_podcast = create(:podcast)
      @other_happy_podcast = create(:podcast)
      @sad_podcast = create(:podcast, mood: "sad")
      @indifferent_podcast = create(:podcast, mood: "indifferent")
    end
    it "returns true if has same mood as podcast passed as argument" do
      expect(@happy_podcast.has_similar_mood(@other_happy_podcast)).to eq(true)
    end

    it "returns true if has similar mood as podcast passed as argument" do
      expect(@happy_podcast.has_similar_mood(@indifferent_podcast)).to eq(true)
    end
    
    it "should return false if podcast does not have similar mood as podcast passed as argument" do
      expect(@podcast.has_similar_mood(@sad_podcast)).to eq(false)
    end
  end

  describe "#average_rating" do
    before do
      @podcast = create(:podcast, :with_ratings)
    end
    it "retuns the average number of stars" do
      expect(@podcast.average_rating).to eq(3.0)
    end 
  end
end

