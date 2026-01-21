class ClientOrder < ApplicationRecord
  belongs_to :client
  belongs_to :product
  belongs_to :menu_item

validates :client_id, presence: true
validates :product_id, presence:true , numericality: true
validates :delivary_date, presence: true
validates :delivary_time, presence: true
before_validation :set_qty , :set_address , :set_status  , :set_name , 

  private

  def set_address
    self.delivary_address = client.address if delivary_address.nil?
  end

  def set_qty
    self.qty = 1 if qty.nil?  
  end

  def set_status
    self.status = "pending" if status.nil?
  end

  def set_name
    self.client_name = client.name if client_name.nil?
  end

  def cal_total
    self.total_price = menu_item.price * qty
  end
end
