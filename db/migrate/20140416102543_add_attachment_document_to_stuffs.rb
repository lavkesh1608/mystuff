class AddAttachmentDocumentToStuffs < ActiveRecord::Migration
  def self.up
    change_table :stuffs do |t|
      t.attachment :document
    end
  end

  def self.down
    drop_attached_file :stuffs, :document
  end
end
