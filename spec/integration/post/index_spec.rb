require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  it 'I can see the user`s profile picture.' do
    visit '/users/108'
    expect(page).to have_selector('img')
  end

  it 'I can see the user`s username' do
    visit '/users/108/posts'
    expect(page).to have_content('test')
  end

  it 'I can see the number of posts the user has written' do
    visit '/users/108/posts'
    expect(page).to have_content('Number of posts:')
  end

  it 'I can see a post`s title' do
    visit '/users/108/posts'
    expect(page).to have_content('post title')
  end

  it 'I can see some of the post`s body.' do
    visit '/users/108/posts'
    expect(page).to have_content('post content')
  end

  it 'I can see the first comments on a post' do
    visit '/users/108/posts'
    expect(page).to have_selector('.post_comments p')
    expect(page).to have_selector('.post_comments p')
    expect(page).to have_selector('.post_comments p')
    expect(page).to have_selector('.post_comments p')
    expect(page).to have_selector('.post_comments p')
  end

  it 'I can see how many comments a post has.' do
    visit '/users/108/posts'
    expect(page).to have_content('Comments:')
  end

  it 'I can see how many likes a post has.' do
    visit '/users/108/posts'
    expect(page).to have_content('Likes:')
  end
end
