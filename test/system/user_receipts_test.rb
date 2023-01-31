require "application_system_test_case"

class UserReceiptsTest < ApplicationSystemTestCase
  setup do
    @user_receipt = user_receipts(:one)
  end

  test "visiting the index" do
    visit user_receipts_url
    assert_selector "h1", text: "User receipts"
  end

  test "should create user receipt" do
    visit user_receipts_url
    click_on "New user receipt"

    fill_in "Address", with: @user_receipt.address
    fill_in "Name", with: @user_receipt.name
    fill_in "Phone", with: @user_receipt.phone
    fill_in "Total", with: @user_receipt.total
    click_on "Create User receipt"

    assert_text "User receipt was successfully created"
    click_on "Back"
  end

  test "should update User receipt" do
    visit user_receipt_url(@user_receipt)
    click_on "Edit this user receipt", match: :first

    fill_in "Address", with: @user_receipt.address
    fill_in "Name", with: @user_receipt.name
    fill_in "Phone", with: @user_receipt.phone
    fill_in "Total", with: @user_receipt.total
    click_on "Update User receipt"

    assert_text "User receipt was successfully updated"
    click_on "Back"
  end

  test "should destroy User receipt" do
    visit user_receipt_url(@user_receipt)
    click_on "Destroy this user receipt", match: :first

    assert_text "User receipt was successfully destroyed"
  end
end
