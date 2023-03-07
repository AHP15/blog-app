require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before :all do
    @user = User.create(name: 'test user3',
                        photo: 'https://png.pngtree.com/png-vector/20190625/ourlarge/pngtree-business-male-user-avatar-vector-png-image_1511454.jpg',
                        bio: 'bio text',
                        posts_counter: 0)
    @post1 = Post.create(
      user_id: @user.id,
      title: 'post title11',
      text: 'post content',
      comments_counter: 0,
      likes_counter: 0
    )
    @post2 = Post.create(
      user_id: @user.id,
      title: 'post title22',
      text: 'post content',
      comments_counter: 0,
      likes_counter: 0
    )
    @post3 = Post.create(
      user_id: @user.id,
      title: 'post title33',
      text: 'post content',
      comments_counter: 0,
      likes_counter: 0
    )
    @post4 = Post.create(
      user_id: @user.id,
      title: 'post title44',
      text: 'post content',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  describe 'profile page' do
    it 'I can see the user`s profile picture.' do
      visit "/users/#{@user.id}"
      expect(page).to have_selector('img')
    end

    it 'I can see the user`s username' do
      visit "/users/#{@user.id}"
      expect(page).to have_content('test')
    end

    it 'I can see the number of posts the user has written' do
      visit "/users/#{@user.id}"
      expect(page).to have_content('Number of posts:')
    end

    it 'I can see the user`s bio' do
      visit "/users/#{@user.id}"
      expect(page).to have_content('Bio')
    end

    it 'I can see the user`s last 3 posts' do
      visit "/users/#{@user.id}"
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
      expect(page).to have_content(@post4.title)
    end

    it 'I can see a button that lets me view all of a user`s posts.' do
      visit "/users/#{@user.id}"
      expect(page).to have_content('See all posts')
    end

    it 'Tests that redirect to the post`s show page when you click on a user`s post.' do
      visit "/users/#{@user.id}"

      click_link @post2.id.to_s

      expect(page).to have_current_path("/users/#{@user.id}/posts/#{@post2.id}")
    end

    it 'redirect to the user post index page when you click on a see all posts.' do
      visit "/users/#{@user.id}"

      click_link 'See all posts'

      expect(page).to have_current_path("/users/#{@user.id}/posts")
    end
  end
end
