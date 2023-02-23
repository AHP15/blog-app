class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def increace_comments_count(post_id)
    Post.find_by(id: post_id).increment!(:comments_counter)
  end
end
