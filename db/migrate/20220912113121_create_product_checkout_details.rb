class CreateProductCheckoutDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :product_checkout_details do |t|
      t.string :name
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
