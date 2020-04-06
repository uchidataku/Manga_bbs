class Post < ApplicationRecord
  belongs_to :user
  has_many :category_posts
  has_many :categories, through: :category_posts
  has_many :responses
  default_scope -> { order(created_at: :desc) }
end
