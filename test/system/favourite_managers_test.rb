require "application_system_test_case"

class FavouriteManagersTest < ApplicationSystemTestCase
  setup do
    @favourite_manager = favourite_managers(:one)
  end

  test "visiting the index" do
    visit favourite_managers_url
    assert_selector "h1", text: "Favourite managers"
  end

  test "should create favourite manager" do
    visit favourite_managers_url
    click_on "New favourite manager"

    fill_in "Product", with: @favourite_manager.product_id
    fill_in "User", with: @favourite_manager.user_id
    click_on "Create Favourite manager"

    assert_text "Favourite manager was successfully created"
    click_on "Back"
  end

  test "should update Favourite manager" do
    visit favourite_manager_url(@favourite_manager)
    click_on "Edit this favourite manager", match: :first

    fill_in "Product", with: @favourite_manager.product_id
    fill_in "User", with: @favourite_manager.user_id
    click_on "Update Favourite manager"

    assert_text "Favourite manager was successfully updated"
    click_on "Back"
  end

  test "should destroy Favourite manager" do
    visit favourite_manager_url(@favourite_manager)
    click_on "Destroy this favourite manager", match: :first

    assert_text "Favourite manager was successfully destroyed"
  end
end
