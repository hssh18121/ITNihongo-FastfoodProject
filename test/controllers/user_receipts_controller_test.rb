require "test_helper"

class UserReceiptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_receipt = user_receipts(:one)
  end

  test "should get index" do
    get user_receipts_url
    assert_response :success
  end

  test "should get new" do
    get new_user_receipt_url
    assert_response :success
  end

  test "should create user_receipt" do
    assert_difference("UserReceipt.count") do
      post user_receipts_url, params: { user_receipt: { address: @user_receipt.address, name: @user_receipt.name, phone: @user_receipt.phone, total: @user_receipt.total } }
    end

    assert_redirected_to user_receipt_url(UserReceipt.last)
  end

  test "should show user_receipt" do
    get user_receipt_url(@user_receipt)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_receipt_url(@user_receipt)
    assert_response :success
  end

  test "should update user_receipt" do
    patch user_receipt_url(@user_receipt), params: { user_receipt: { address: @user_receipt.address, name: @user_receipt.name, phone: @user_receipt.phone, total: @user_receipt.total } }
    assert_redirected_to user_receipt_url(@user_receipt)
  end

  test "should destroy user_receipt" do
    assert_difference("UserReceipt.count", -1) do
      delete user_receipt_url(@user_receipt)
    end

    assert_redirected_to user_receipts_url
  end
end
