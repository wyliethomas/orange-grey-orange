class Admin < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :status
  attr_accessor :password, :password_confirmation

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :password, :with => /^(?=.*[a-zA-Z]).{6,}$/
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_confirmation_of :password

  before_save :encrypt_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
