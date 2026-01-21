# app/channels/realtime_channel.rb
class RealtimeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "realtime"
  end

  def receive(data)
    menu_category = MenuCategory.create!(
      name: data["name"],
      description: data["description"],
      position: data["position"]
    )

    ActionCable.server.broadcast(
      "realtime",
      {
        id: menu_category.id,
        name: menu_category.name,
        description: menu_category.description,
        position: menu_category.position
      }
    )
  end

  def unsubscribed
    # Cleanup if needed
  end
end
