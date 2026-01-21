class ClientOrdersController < ApplicationController
  before_action :set_client_order, only: %i[ show edit update destroy ]

  # GET /client_orders or /client_orders.json
  def index
    @client_orders = ClientOrder.all
  end

  # GET /client_orders/1 or /client_orders/1.json
  def show
  end

  # GET /client_orders/new
  def new
    @client_order = ClientOrder.new
  end

  # GET /client_orders/1/edit
  def edit
  end

  # POST /client_orders or /client_orders.json
  def create
    @client_order = ClientOrder.new(client_order_params)

    respond_to do |format|
      if @client_order.save
        format.html { redirect_to @client_order, notice: "Client order was successfully created." }
        format.json { render :show, status: :created, location: @client_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_orders/1 or /client_orders/1.json
  def update
    respond_to do |format|
      if @client_order.update(client_order_params)
        format.html { redirect_to @client_order, notice: "Client order was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @client_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_orders/1 or /client_orders/1.json
  def destroy
    @client_order.destroy!

    respond_to do |format|
      format.html { redirect_to client_orders_path, notice: "Client order was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_order
      @client_order = ClientOrder.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def client_order_params
      params.expect(client_order: [ :client_id, :delivary_address, :delivary_date, :delivary_time, :client_name, :phone_number, :status, :total_price :qty])
    end
end
