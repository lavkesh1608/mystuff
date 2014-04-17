class Stuff < ActiveRecord::Base
  
  has_attached_file :document, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "411x274>", :large => "1280x854>" }, :default_url => "missing.gif"  

  
end
