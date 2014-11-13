class AddAttachmentAudioToPodcasts < ActiveRecord::Migration
  def self.up
    change_table :podcasts do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :podcasts, :audio
  end
end
