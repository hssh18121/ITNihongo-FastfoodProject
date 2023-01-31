json.extract! user_receipt, :id, :name, :phone, :address, :total, :created_at, :updated_at
json.url user_receipt_url(user_receipt, format: :json)
