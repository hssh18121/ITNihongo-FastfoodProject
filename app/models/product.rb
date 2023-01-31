class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :favourite_managers
  has_many :users, through: :favourite_managers
end
