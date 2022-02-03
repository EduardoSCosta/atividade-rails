class CreateTelephones < ActiveRecord::Migration[6.1]
  def change
    create_table :telephones do |t|
      t.integer :phone_number
      t.string :phone_type
      t.boolean :main_phone
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
