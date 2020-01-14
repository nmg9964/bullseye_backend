class ChangePhoneNumberToBeStringInEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :phone_number, :string
  end
end
