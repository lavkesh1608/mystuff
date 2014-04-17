class AddAttachmentDocumentToStuffsecurities < ActiveRecord::Migration
  def self.up
    change_table :stuffsecurities do |t|
      t.attachment :document
    end
  end

  def self.down
    drop_attached_file :stuffsecurities, :document
  end
end
