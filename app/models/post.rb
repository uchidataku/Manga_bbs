class Post < ApplicationRecord
  belongs_to :user
  has_many :category_posts
  has_many :categories, through: :category_posts
  has_many :responses
  default_scope -> { order(created_at: :desc) }
  
  def self.search(search)
    if search
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
