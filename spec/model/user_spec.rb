require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'test user', photo: 'https://png.pngtree.com/png-vector/20190625/ourlarge/pngtree-business-male-user-avatar-vector-png-image_1511454.jpg', bio: 'bio text', posts_counter: 0) }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter should be positive' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should return last three posts' do
    last_posts = subject.last_user_posts(subject.id)
    expect(last_posts.length).to eq(0)
  end
end
