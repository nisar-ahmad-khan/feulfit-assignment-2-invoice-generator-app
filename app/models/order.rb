class Order < ApplicationRecord
  belongs_to :client
  belongs_to :menu_item

validates :client_id, presence: true
validates :menu_item_id, presence:true , numericality: true
validates :delivary_date, presence: true
validates :delivary_time, presence: true
before_validation  :set_address , :set_status 
before_save :set_qty , :cal_total , :set_name,:set_number
  private

  def set_address
    self.delivery_address = client.address if delivery_address.nil?
  end

  def set_qty
    self.qty = 1 if qty.nil?
  end

  def set_status
    self.status = "pending" if status.nil?
  end

  def set_name
    self.customer_name = client.name if customer_name.nil?
  end

  def cal_total
    self.total_price = menu_item.price.to_f * qty
  end

  def set_number
    self.phone_number = client.phone if phone_number.nil?
  end
end
