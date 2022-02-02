require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  context 'data is valid' do
    it 'User have a count of 2' do
      user = User.new( name: "User_03", age: 21, bio: "Lorem Ipsum").save
      expect(User.all.count).to eq(3)
    end
  end
end
