require 'rails_helper'

RSpec.describe Post, type: :model do
  before :all do
    @user = User.create(name: 'test',
      photo: 'https://png.pngtree.com/png-vector/20190625/ourlarge/pngtree-business-male-user-avatar-vector-png-image_1511454.jpg',
      posts_counter: 0
    )
    @post = Post.create(
      user_id: @user.id,
      title: 'post title',
      text: 'post content',
      comments_counter: 0,
      likes_counter: 0
    )

    @user.save
    @post.save
  end

  it 'is valid with valid attributes' do
    expect(@post).to be_valid
  end

  it 'title should be present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'title should not exceed 250 chars' do
    @post.title = 'random' * 50
    expect(@post).to_not be_valid
  end

  it 'comment counter should be positive' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end

  it 'likes counter should be positive' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end

  it 'should increment posts count for a user' do
    @post.increace_posts_count(@user.id)

    expect(@user.posts_counter).to eq(@user.posts_counter)
  end
end
