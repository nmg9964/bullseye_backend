class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.integer :phone_number
      t.integer :guest_count
      t.string :message
      t.references :administrator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
