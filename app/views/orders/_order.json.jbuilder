json.extract! order, :id, :client_id, :delivery_address, :delivary_date, :delivary_time, :customer_name, :phone_number, :status, :total_price, :created_at, :updated_at
json.url order_url(order, format: :json)
