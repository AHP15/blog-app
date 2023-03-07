require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @user = User.create(name: 'test user', photo: 'https://png.pngtree.com/png-vector/20190625/ourlarge/pngtree-business-male-user-avatar-vector-png-image_1511454.jpg', bio: 'bio text', posts_counter: 0) 
    @post = Post.create(
      user_id: @user.id,
      title: 'post title',
      text: 'post content',
      comments_counter: 0,
      likes_counter: 0
    )
    @like = Like.create(user_id: @user.id, post_id: @post.id)

    @user.save
    @post.save
    @like.save
  end

  it 'should increment likes count for a post' do
    @like.increace_likes_count(@post.id)

    expect(@post.likes_counter).to eq(@post.likes_counter)
  end
end
