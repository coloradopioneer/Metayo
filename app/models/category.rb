class Category < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 2, maximum: 25 }
	has_many :post_categories
	has_many :posts, through: :post_categories
end