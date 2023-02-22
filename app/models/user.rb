class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  scope :increace_posts_count, ->(user_id) { find_by(id: user_id).increment!(:posts_counter) }
end
