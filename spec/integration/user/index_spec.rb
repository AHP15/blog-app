require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before :all do
    @user = User.create(name: 'test user21',
                        photo: 'https://png.pngtree.com/png-vector/20190625/ourlarge/pngtree-business-male-user-avatar-vector-png-image_1511454.jpg',
                        bio: 'bio text',
                        posts_counter: 0)
    @user.save
  end

  describe 'index page' do
    it 'shows the right content' do
      visit '/'
      expect(page).to have_content(@user.name)
    end

    it 'I can see the profile picture for each user' do
      visit '/'
      expect(page).to have_selector('img')
    end

    it 'I can see the number of posts each user has written' do
      visit '/'
      expect(page).to have_content('Number of posts:')
    end

    it 'When I click on a user, I am redirected to that user`s show page' do
      visit '/'
      click_link @user.name
      expect(page).to have_current_path("/users/#{@user.id}")
    end
  end
end
