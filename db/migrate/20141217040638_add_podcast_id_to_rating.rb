class AddPodcastIdToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :podcast_id, :integer
  end
end
