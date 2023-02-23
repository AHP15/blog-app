require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @user = User.new(name: 'test', posts_counter: 0)
    @post = Post.new(
      user_id: @user.id,
      title: 'post title',
      text: 'post content',
      comments_counter: 0,
      likes_counter: 0
    )
    @like = Like.new(user_id: @user.id, post_id: @post.id)

    @user.save
    @post.save
    @like.save
  end

  it 'should increment likes count for a post' do
    prev_length = @post.likes_counter.length

    @like.increace_posts_count(@post.id)

    expect(@post.likes_counter.length).to eq(prev_length + 1)
  end
end
