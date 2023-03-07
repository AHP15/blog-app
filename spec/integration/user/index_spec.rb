require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit '/'
      expect(page).to have_content('test')
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
      click_link 'test1'
      expect(page).to have_content('Bio')
    end
  end
end
