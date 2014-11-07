class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.integer :length
      t.string :author
      t.string :genre

      t.timestamps
    end
  end
end
