require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  context 'data is valid' do
    it 'User have a count of 2' do
      user = User.new( name: "User_03", age: 21, bio: "Lorem Ipsum" ).save
      expect(User.all.count).to eq(3)
    end
  end

  context 'data is invalid' do
    it 'user is invalid when name is blank' do
      user = User.new( bio: "Lorem Ipsum" )
      expect(user).to be_invalid
    end

    it 'user is invalid when name has already been taken' do
      user = User.new( name: "User_01" )
      expect(user).to be_invalid
    end
  end
end
