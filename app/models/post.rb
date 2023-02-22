class Post < ApplicationRecord
  belongs_to :user

  scope :last_user_posts, ->(user_id) { where(user_id:).last(3) }
  scope :increace_comments_count, ->(post_id) { find_by(id: post_id).increment!(:comments_counter) }
  scope :increace_likes_count, ->(post_id) { find_by(id: post_id).increment!(:likes_counter) }
end
