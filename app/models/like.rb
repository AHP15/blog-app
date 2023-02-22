class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  scope :increace_likes_count, ->(post_id) { Post.find_by(id: post_id).increment!(:likes_counter) }
end
