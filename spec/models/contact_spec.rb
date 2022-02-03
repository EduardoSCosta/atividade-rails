require 'rails_helper'

RSpec.describe Contact, type: :model do
  fixtures :contacts

  context 'data is valid' do
    it 'return a count of 3 after saving a new entry in the Contact table' do
      contact = Contact.new( name: "Contact_03", user_id: 1).save
      expect(Contact.all.count).to eq(3)
    end

    context 'data is invalid' do
      it 'return a validation error when contact name is blank' do
        contact = Contact.new( birthday: "1990-01-01", user_id: 1 )
        expect(contact).to be_invalid
      end
  
      it 'return a validation error when contact name has already been taken for another contact on that user' do
        contact = Contact.new( name: "Contact_01", user_id: 1 )
        expect(contact).to be_invalid
      end

      it 'return a validation error when user doesn\'t exist' do
        contact = Contact.new( name: "Contact_01", user_id: 8 )
        expect(contact).to be_invalid
      end
  
      it 'return a validation error when user_id is blank' do
        contact = Contact.new( name: "Contact_01" )
        expect(contact).to be_invalid
      end
    end
  end
end
