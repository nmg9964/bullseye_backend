class AddDefaultValueToMessage < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :message, :string, default: ''
  end
end
