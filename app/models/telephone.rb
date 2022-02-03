class Telephone < ApplicationRecord
  belongs_to :contact
  validates :phone_number, presence: true, uniqueness: true
  validates :phone_type, presence: true
  validates :main_phone, inclusion: { in: [true, false] }, uniqueness: { scope: :contact_id, if: :main_phone }
end
