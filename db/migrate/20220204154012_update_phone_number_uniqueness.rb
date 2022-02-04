class UpdatePhoneNumberUniqueness < ActiveRecord::Migration[6.1]
  def change
    remove_index :telephones, :phone_number, name: :index_telephones_on_phone_number
    add_index :telephones, [:phone_number, :contact_id], unique: true
  end
end
