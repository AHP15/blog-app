class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :last_post_comments, ->(post_id) { where(post_id: post_id).last(5) }
end
