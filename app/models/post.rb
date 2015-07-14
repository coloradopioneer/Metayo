class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :post_tags
  has_many :tags, through: :post_tags
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :content, presence: true, length: { minimum: 5, maximum: 100 }
  default_scope -> { order(updated_at: :desc) }

  def vote_up_total
  	self.likes.where(like: true).size
  end

  def vote_down_total
  	self.likes.where(like: false).size
  end
  
end