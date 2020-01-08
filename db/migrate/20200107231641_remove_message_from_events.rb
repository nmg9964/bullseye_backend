class RemoveMessageFromEvents < ActiveRecord::Migration[6.0]
  def change

    remove_column :events, :message, :string
  end
end
