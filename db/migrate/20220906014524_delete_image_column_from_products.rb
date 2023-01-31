class DeleteImageColumnFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :image, :string
  end
end
