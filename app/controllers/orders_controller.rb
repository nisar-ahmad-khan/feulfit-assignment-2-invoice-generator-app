class OrdersController < ApplicationController
  before_action :set_cart, only: [ :new, :create]
  before_action :set_order, only: [ :show, :edit, :update]

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def new
    @order = Order.new
    if @cart
      @order.client_id     = @cart.client_id
      @order.menu_item_id  = @cart.menu_item_id
      @order.qty           = @cart.qty
      @order.customer_name = @cart.client.name
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @cart&.destroy
      redirect_to @order, notice: "Order created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @order is already set by set_order
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_cart
    @cart = Cart.find_by(id: params[:cart_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :client_id,
      :menu_item_id,
      :qty,
      :customer_name,
      :phone_number,
      :delivery_address,
      :delivary_date,
      :delivary_time
    )
  end
end
