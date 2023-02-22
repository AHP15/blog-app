class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  scope :last_user_posts, ->(user_id) { Post.where(user_id:).last(3) }
end
