class AddUniqueContactsName < ActiveRecord::Migration[6.1]
  def change
    add_index :contacts, [:name, :user_id], unique: true
  end
end
