require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  context 'data is valid' do
    it 'return a count of 3 after saving a new entry in the User table' do
      user = User.new( name: "User_03", age: 21, bio: "Lorem Ipsum" ).save
      expect(User.all.count).to eq(3)
    end
  end

  context 'data is invalid' do
    it 'return a error when user name is blank' do
      user = User.new( bio: "Lorem Ipsum" )
      expect(user).to be_invalid
    end

    it 'return a error when user name has already been taken' do
      user = User.new( name: "User_01" )
      expect(user).to be_invalid
    end
  end
end
