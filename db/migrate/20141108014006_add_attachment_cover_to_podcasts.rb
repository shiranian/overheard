class AddAttachmentCoverToPodcasts < ActiveRecord::Migration
  def self.up
    change_table :podcasts do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :podcasts, :cover
  end
end
