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
  end

  it 'I can see the user`s profile picture.' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_selector('img')
  end

  it 'I can see the user`s username' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('test')
  end

  it 'I can see the number of posts the user has written' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('Number of posts:')
  end

  it 'I can see a post`s title' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('post title')
  end

  it 'I can see some of the post`s body.' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('post content')
  end

  it 'I can see the first comments on a post' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_selector('.post_comments p')
    expect(page).to have_selector('.post_comments p')
    expect(page).to have_selector('.post_comments p')
    expect(page).to have_selector('.post_comments p')
    expect(page).to have_selector('.post_comments p')
  end

  it 'I can see how many comments a post has.' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('Comments:')
  end

  it 'I can see how many likes a post has.' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('Likes:')
  end

  it 'redirects to the post show page when you click on a post.' do
    visit "/users/#{@user.id}/posts"

    click_link @post.id.to_s

    expect(page).to have_current_path("/users/#{@user.id}/posts/#{@post.id}")
  end
end
