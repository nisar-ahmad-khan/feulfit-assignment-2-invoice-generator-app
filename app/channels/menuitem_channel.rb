class MenuitemChannel < ApplicationCable::Channel
  def subscribed
    stream_from "menuitem"
  end

  def receive(data)
    menu_item = MenuItem.create!(
      menu_category_id: data['menu_category_id'],
      name: data['name'],
      description: data['description'],
      image_url: data['image_url'],
      price: data['price'],
      available: data['available']
    )

  ActionCable.server.broadcast('menuitem',{
    id: menu_item.id,
    name: menu_item.name,
    description: menu_item.description,
    image_url: menu_item.image_url,
    price: menu_item.price,
    available: menu_item.available
  })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
