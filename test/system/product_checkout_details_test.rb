require "application_system_test_case"

class ProductCheckoutDetailsTest < ApplicationSystemTestCase
  setup do
    @product_checkout_detail = product_checkout_details(:one)
  end

  test "visiting the index" do
    visit product_checkout_details_url
    assert_selector "h1", text: "Product checkout details"
  end

  test "should create product checkout detail" do
    visit product_checkout_details_url
    click_on "New product checkout detail"

    fill_in "Name", with: @product_checkout_detail.name
    fill_in "Price", with: @product_checkout_detail.price
    fill_in "Quantity", with: @product_checkout_detail.quantity
    click_on "Create Product checkout detail"

    assert_text "Product checkout detail was successfully created"
    click_on "Back"
  end

  test "should update Product checkout detail" do
    visit product_checkout_detail_url(@product_checkout_detail)
    click_on "Edit this product checkout detail", match: :first

    fill_in "Name", with: @product_checkout_detail.name
    fill_in "Price", with: @product_checkout_detail.price
    fill_in "Quantity", with: @product_checkout_detail.quantity
    click_on "Update Product checkout detail"

    assert_text "Product checkout detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Product checkout detail" do
    visit product_checkout_detail_url(@product_checkout_detail)
    click_on "Destroy this product checkout detail", match: :first

    assert_text "Product checkout detail was successfully destroyed"
  end
end
