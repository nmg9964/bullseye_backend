class AddMessageToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :message, :string, default: nil
  end
end
