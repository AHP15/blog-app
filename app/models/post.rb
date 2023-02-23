class Post < ApplicationRecord
  validates :title, presence: true, maximum: 250
  validates :comments_counter, minimum: 0
  validates :likes_counter, minimum: 0

  belongs_to :user, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  scope :increace_posts_count, ->(user_id) { User.find_by(id: user_id).increment!(:posts_counter) }
  scope :last_post_comments, ->(post_id) { Comment.where(post_id:).last(5) }
end
