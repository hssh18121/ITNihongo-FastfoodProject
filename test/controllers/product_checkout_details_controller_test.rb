require "test_helper"

class ProductCheckoutDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_checkout_detail = product_checkout_details(:one)
  end

  test "should get index" do
    get product_checkout_details_url
    assert_response :success
  end

  test "should get new" do
    get new_product_checkout_detail_url
    assert_response :success
  end

  test "should create product_checkout_detail" do
    assert_difference("ProductCheckoutDetail.count") do
      post product_checkout_details_url, params: { product_checkout_detail: { name: @product_checkout_detail.name, price: @product_checkout_detail.price, quantity: @product_checkout_detail.quantity } }
    end

    assert_redirected_to product_checkout_detail_url(ProductCheckoutDetail.last)
  end

  test "should show product_checkout_detail" do
    get product_checkout_detail_url(@product_checkout_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_checkout_detail_url(@product_checkout_detail)
    assert_response :success
  end

  test "should update product_checkout_detail" do
    patch product_checkout_detail_url(@product_checkout_detail), params: { product_checkout_detail: { name: @product_checkout_detail.name, price: @product_checkout_detail.price, quantity: @product_checkout_detail.quantity } }
    assert_redirected_to product_checkout_detail_url(@product_checkout_detail)
  end

  test "should destroy product_checkout_detail" do
    assert_difference("ProductCheckoutDetail.count", -1) do
      delete product_checkout_detail_url(@product_checkout_detail)
    end

    assert_redirected_to product_checkout_details_url
  end
end
