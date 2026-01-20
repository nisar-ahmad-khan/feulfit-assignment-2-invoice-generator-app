require "test_helper"

class OptionGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @option_group = option_groups(:one)
  end

  test "should get index" do
    get option_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_option_group_url
    assert_response :success
  end

  test "should create option_group" do
    assert_difference("OptionGroup.count") do
      post option_groups_url, params: { option_group: { max_selection: @option_group.max_selection, menu_item_id: @option_group.menu_item_id, min_selection: @option_group.min_selection, name: @option_group.name, required: @option_group.required } }
    end

    assert_redirected_to option_group_url(OptionGroup.last)
  end

  test "should show option_group" do
    get option_group_url(@option_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_option_group_url(@option_group)
    assert_response :success
  end

  test "should update option_group" do
    patch option_group_url(@option_group), params: { option_group: { max_selection: @option_group.max_selection, menu_item_id: @option_group.menu_item_id, min_selection: @option_group.min_selection, name: @option_group.name, required: @option_group.required } }
    assert_redirected_to option_group_url(@option_group)
  end

  test "should destroy option_group" do
    assert_difference("OptionGroup.count", -1) do
      delete option_group_url(@option_group)
    end

    assert_redirected_to option_groups_url
  end
end
