json.extract! line_item, :id, :description, :unit_price, :total_amount, :invoice_id, :product_id, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)
