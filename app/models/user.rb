class User < ActiveRecord::Base
  attr_accessor :password
  validates_presence_of :email, :password, :first_name, :last_name
  before_save :encrypt_password
  
has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "411x274>", :large => "1280x854>" }, :default_url => "missing.gif"  
  validates_attachment :profile_pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
    end
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end 

  
end
