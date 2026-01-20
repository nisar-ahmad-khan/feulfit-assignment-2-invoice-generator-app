json.extract! menu_item, :id, :menu_category_id, :name, :description, :image_url, :price, :available, :created_at, :updated_at
json.url menu_item_url(menu_item, format: :json)
