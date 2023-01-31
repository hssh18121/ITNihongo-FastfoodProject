json.extract! product_checkout_detail, :id, :name, :price, :quantity, :created_at, :updated_at
json.url product_checkout_detail_url(product_checkout_detail, format: :json)
