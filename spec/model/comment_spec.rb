require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @user = User.create(name: 'test user',
                        photo: 'https://png.pngtree.com/png-vector/20190625/ourlarge/pngtree-business-male-user-avatar-vector-png-image_1511454.jpg',
                        bio: 'bio text',
                        posts_counter: 0)
    @post = Post.create(
      user_id: @user.id,
      title: 'post title',
      text: 'post content',
      comments_counter: 0,
      likes_counter: 0
    )
    @comment = Comment.create(user_id: @user.id, post_id: @post.id)

    @user.save
    @post.save
    @comment.save
  end

  it 'should increment comments count for a post' do
    @comment.increace_comments_count(@post.id)

    expect(@post.comments_counter).to eq(@post.comments_counter)
  end
end
