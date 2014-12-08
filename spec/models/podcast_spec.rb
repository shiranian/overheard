require "rails_helper"

describe Podcast do
  describe "has_n_or_more_tags" do

    before do
      @podcast = Podcast.new
      @podcast2 = Podcast.new
      @podcast.tag_list.add("surf", "technology", "podcast")
      @podcast2.tag_list.add("surf", "technology")
    end 

    it "return true if podcast in argument includes n number of tags of podcast calling the method" do
      expect(@podcast.has_n_or_more_tags(2, @podcast2)).to eq(true)
    end

    it "returns false if podcast in argument does not include n number of tags of podcast calling the method" do
      expect(@podcast.has_n_or_more_tags(3, @podcast2)).to eq(false)
    end
  end
end

