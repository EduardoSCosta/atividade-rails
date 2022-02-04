require 'rails_helper'

RSpec.describe Telephone, type: :model do
  fixtures :telephones

  context 'data is valid' do
    it 'return a count of 5 after saving a new entry in the Telephone table' do
      telephone = Telephone.new( phone_number: 963852741, phone_type: "home", main_phone: false, contact_id: 1 ).save
      expect(Telephone.all.count).to eq(5)
    end
  end

  context 'data is invalid' do
    it 'return a validation error when telephone phone_number is blank' do
      telephone = Telephone.new( phone_type: "home", main_phone: false, contact_id: 1 )
      expect(telephone).to be_invalid
    end

    it 'return a validation error when telephone phone_type is blank' do
      telephone = Telephone.new( phone_number: 963852741, main_phone: false, contact_id: 1 )
      expect(telephone).to be_invalid
    end

    it 'return a validation error when telephone main_phone is blank' do
      telephone = Telephone.new( phone_number: 963852741, phone_type: "home", contact_id: 1 )
      expect(telephone).to be_invalid
    end

    it 'return a validation error when the contact already has a main_phone' do
      telephone = Telephone.new( phone_number: 963852741, phone_type: "home", main_phone: true, contact_id: 1 )
      expect(telephone).to be_invalid
    end

    it 'return a validation error when the phone_number has already been taken by that contact' do
      telephone = Telephone.new( phone_number: 123456789, phone_type: "home", main_phone: false, contact_id: 1 )
      expect(telephone).to be_invalid
    end

    it 'return a validation error when trying to assign a telephone to a contact that doesn\'t exist' do
      telephone = Telephone.new( phone_number: 963852741, phone_type: "home", main_phone: false, contact_id: 8)
      expect(telephone).to be_invalid
    end

    it 'return a validation error when not assigned to a contact' do
      telephone = Telephone.new( phone_number: 963852741, phone_type: "home", main_phone: false)
      expect(telephone).to be_invalid
    end
  end
end
