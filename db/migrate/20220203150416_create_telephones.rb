class CreateTelephones < ActiveRecord::Migration[6.1]
  def change
    create_table :telephones do |t|
      t.string :phone_number, null: false
      t.string :phone_type, null: false
      t.boolean :main_phone, null: false
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
    add_index :telephones, :phone_number, unique: true
    add_index :telephones, [:main_phone, :contact_id], unique: true, where: "main_phone IS TRUE"
  end
end
