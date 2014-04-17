class Stuffsecurity < ActiveRecord::Base
    has_attached_file :document, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "411x274>", :large => "1280x854>" }, :default_url => "missing.gif"  
  validates_attachment :document, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  
end
