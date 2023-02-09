class AddStatusToOrder < ActiveRecord::Migration[7.0]
  def change
      add_column :user_receipts, :status, :integer
  end
end
