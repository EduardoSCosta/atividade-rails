class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :contacts
  has_many :telephones, through: :contacts
end
