json.extract! receipt, :id, :status, :payment, :total, :user_id, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
