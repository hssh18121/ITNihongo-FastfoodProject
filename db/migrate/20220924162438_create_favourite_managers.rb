class CreateFavouriteManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :favourite_managers do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
