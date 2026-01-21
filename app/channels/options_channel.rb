class OptionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "options"
  end

  def receive(data)
    option = Option.create!(
      option_group_id: data['option_group_id'],
      name: data['name'],
      price: data['price']
    )
    ActionCable.server.broadcast(
      "options",
      {
        id: option.id,
        option_group_id: option.option_group_id,
        name: option.name,
        price: option.price
      }
    )
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
