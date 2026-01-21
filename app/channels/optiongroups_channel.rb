class OptiongroupsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "optiongroup"
  end

  def receive(data)
   option_group =  OptionGroup.create!(
      menu_item_id: data['menu_item_id'],
      name: data['name'],
      required: data['required'],
      min_selection: data['min_selection'],
      max_selection: data['max_selection']
    )
    ActionCable.server.broadcast(
      "optiongroup",
      {
        id: option_group.id,
        menu_item_id: option_group.menu_item_id,
        name: option_group.name,
        required: option_group.required,
        min_selection: option_group.min_selection,
        max_selection: option_group.max_selection
      }
    )
  end
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
