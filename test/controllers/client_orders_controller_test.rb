require "test_helper"

class ClientOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_order = client_orders(:one)
  end

  test "should get index" do
    get client_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_client_order_url
    assert_response :success
  end

  test "should create client_order" do
    assert_difference("ClientOrder.count") do
      post client_orders_url, params: { client_order: { client_id: @client_order.client_id, client_name: @client_order.client_name, delivary_address: @client_order.delivary_address, delivary_date: @client_order.delivary_date, delivary_time: @client_order.delivary_time, phone_number: @client_order.phone_number, status: @client_order.status, total_price: @client_order.total_price } }
    end

    assert_redirected_to client_order_url(ClientOrder.last)
  end

  test "should show client_order" do
    get client_order_url(@client_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_order_url(@client_order)
    assert_response :success
  end

  test "should update client_order" do
    patch client_order_url(@client_order), params: { client_order: { client_id: @client_order.client_id, client_name: @client_order.client_name, delivary_address: @client_order.delivary_address, delivary_date: @client_order.delivary_date, delivary_time: @client_order.delivary_time, phone_number: @client_order.phone_number, status: @client_order.status, total_price: @client_order.total_price } }
    assert_redirected_to client_order_url(@client_order)
  end

  test "should destroy client_order" do
    assert_difference("ClientOrder.count", -1) do
      delete client_order_url(@client_order)
    end

    assert_redirected_to client_orders_url
  end
end
