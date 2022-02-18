class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :contacts, dependent: :destroy
  has_many :telephones, through: :contacts, dependent: :destroy
end
