require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'profile page' do
    it 'I can see the user`s profile picture.' do
      visit '/users/108'
      expect(page).to have_selector('img')
    end

    it 'I can see the user`s username' do
      visit '/users/108'
      expect(page).to have_content('test')
    end

    it 'I can see the number of posts the user has written' do
      visit '/users/108'
      expect(page).to have_content('Number of posts:')
    end

    it 'I can see the user`s bio' do
      visit '/users/108'
      expect(page).to have_content('Bio')
    end

    it 'I can see the user`s last 3 posts' do
      visit '/users/108'
      expect(page).to have_selector('a')
      expect(page).to have_selector('a')
      expect(page).to have_selector('a')
    end

    it 'I can see a button that lets me view all of a user`s posts.' do
      visit '/users/108'
      expect(page).to have_content('See all posts')
    end
  end
end
