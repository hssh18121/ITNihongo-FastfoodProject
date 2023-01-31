class AddUserIdToReceipt < ActiveRecord::Migration[7.0]
  def change
    add_column :user_receipts, :user_id, :int
  end
end
