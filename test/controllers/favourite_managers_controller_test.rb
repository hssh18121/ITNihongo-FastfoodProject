require "test_helper"

class FavouriteManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favourite_manager = favourite_managers(:one)
  end

  test "should get index" do
    get favourite_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_favourite_manager_url
    assert_response :success
  end

  test "should create favourite_manager" do
    assert_difference("FavouriteManager.count") do
      post favourite_managers_url, params: { favourite_manager: { product_id: @favourite_manager.product_id, user_id: @favourite_manager.user_id } }
    end

    assert_redirected_to favourite_manager_url(FavouriteManager.last)
  end

  test "should show favourite_manager" do
    get favourite_manager_url(@favourite_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_favourite_manager_url(@favourite_manager)
    assert_response :success
  end

  test "should update favourite_manager" do
    patch favourite_manager_url(@favourite_manager), params: { favourite_manager: { product_id: @favourite_manager.product_id, user_id: @favourite_manager.user_id } }
    assert_redirected_to favourite_manager_url(@favourite_manager)
  end

  test "should destroy favourite_manager" do
    assert_difference("FavouriteManager.count", -1) do
      delete favourite_manager_url(@favourite_manager)
    end

    assert_redirected_to favourite_managers_url
  end
end
