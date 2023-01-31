json.extract! user, :id, :account, :name, :email, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
