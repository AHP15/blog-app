require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  it 'I can see the user`s username' do
    visit '/users/108/posts/48'
    expect(page).to have_content('test')
  end


  it 'I can see a post`s title' do
    visit '/users/108/posts/48'
    expect(page).to have_content('post title')
  end

  it 'I can see  the post`s body.' do
    visit '/users/108/posts/48'
    expect(page).to have_content('post content')
  end

  it 'I can see how many comments a post has.' do
    visit '/users/108/posts/48'
    expect(page).to have_content('Comments:')
  end

  it 'I can see how many likes a post has.' do
    visit '/users/108/posts/48'
    expect(page).to have_content('Likes:')
  end
end
