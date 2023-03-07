require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before :all do
    @user = User.create(name: 'test user3',
                        photo: 'https://png.pngtree.com/png-vector/20190625/ourlarge/pngtree-business-male-user-avatar-vector-png-image_1511454.jpg',
                        bio: 'bio text',
                        posts_counter: 0)
    @post = Post.create(
      user_id: @user.id,
      title: 'post title11',
      text: 'post content',
      comments_counter: 0,
      likes_counter: 0
    )
    @user2 = User.create(
      name: 'test user4',
      photo: 'https://png.pngtree.com/png-vector/20190625/ourlarge/pngtree-business-male-user-avatar-vector-png-image_1511454.jpg',
      bio: 'bio text',
      posts_counter: 0)
    @comment = Comment.create(user_id: @user2.id, post_id: @post.id, text: 'comment text')
  end

  it 'I can see the user`s username' do
    visit "/users/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content(@user.name)
  end

  it 'I can see a post`s title' do
    visit "/users/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content(@post.title)
  end

  it 'I can see  the post`s body.' do
    visit "/users/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content(@post.text)
  end

  it 'I can see how many comments a post has.' do
    visit "/users/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content('Comments:')
  end

  it 'I can see how many likes a post has.' do
    visit "/users/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content('Likes:')
  end

  it 'I can see the username of each commenter' do
    visit "/users/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content(@user2.name)
  end

  it 'I can see the comment each commentor left' do
    visit "/users/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content(@comment.text)
  end
end
