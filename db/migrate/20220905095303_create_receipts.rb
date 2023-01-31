class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.string :status
      t.integer :payment
      t.integer :total
      t.integer :user_id

      t.timestamps
    end
  end
end
