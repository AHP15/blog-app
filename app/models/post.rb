class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  belongs_to :user, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def increace_posts_count(user_id)
    User.find_by(id: user_id).increment!(:posts_counter)
  end

  def last_post_comments(post_id)
    comments = Comment.where(post_id:).last(5)
    results = []
    comments.each do |comment|
      name = User.find(comment.user_id).name
      results.push({ 'name' => name, 'text' => comment.text })
    end

    results
  end
end
