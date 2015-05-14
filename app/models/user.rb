class User < ActiveRecord::Base
  has_many :posts
  has_many :likes
  before_save { self.email = email.downcase }
  validates :name, presence: true
  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
end