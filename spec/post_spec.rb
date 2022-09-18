require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.create(
      author: User.create(
        name: 'waqas',
        photo: 'httP://www.abc.com',
        bio: 'A bio post',
        posts_counter: 0
      ),
      title: 'Title of the post',
      text: 'Some text of the mpost',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  it 'Title should not be empty' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title length shoud not be > 250' do
    subject.title = 'hi' * 50
    expect(subject).to be_valid
  end

  it 'title length should not be > 250' do
    subject.title = 'bye' * 300
    expect(subject).to_not be_valid
  end

  it 'Comments counter shoulb be inter' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'Likes counter must be an integer greater than or equal to zero.' do
    subject.likes_counter = -10
    expect(subject).to_not be_valid
  end

  it 'Show recent comments method' do
    expect(subject.comments_counter).to be_an_integer
  end

  it 'Show recent comments method' do
    10.times { subject.comments.create(text: 'Comment', author: subject.author) }
    expect(subject.show_recent_comments.count).to eq(5)
  end
end