class CreateUserReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_receipts do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.integer :total

      t.timestamps
    end
  end
end
