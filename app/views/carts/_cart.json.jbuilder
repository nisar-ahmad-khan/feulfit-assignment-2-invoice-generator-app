json.extract! cart, :id, :customer_id, :menu_item_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)
