class User < ActiveRecord::Base
  attr_accessor :password
  validates_confirmation_of :password
  validates :email, uniqueness: true
  before_save :encrypt_password
  after_save :send_confirmation_mail
  has_many :questions
  has_many :answers

  def encrypt_password
    self.password_salt ||= BCrypt::Engine.generate_salt
    self.password_hash ||= BCrypt::Engine.hash_secret(password, password_salt)
  end

  def send_confirmation_mail
    UserMailer.signup_confirmation(self).deliver_now
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      return user
    else
      return nil
    end
  end
end
