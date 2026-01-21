json.extract! client_order, :id, :client_id, :delivary_address, :delivary_date, :delivary_time, :client_name, :phone_number, :status, :total_price, :created_at, :updated_at
json.url client_order_url(client_order, format: :json)
