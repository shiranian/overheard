class AddMoodToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :mood, :string
  end
end
