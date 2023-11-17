require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "should display cart" do
    visit store_index_url
    click_on 'Add to Cart', match: :first

    assert_text "Line item was successfully created."
    assert_text "Your Cart"
  end

  test "should hide cart" do
    visit store_index_url
    click_on 'Add to Cart', match: :first
    click_on 'Empty Cart'

    assert_text "Your cart is currently empty"
    assert_no_text "Your Cart"
  end

  test "should highlight new line_item in the cart" do
    visit store_index_url
    click_on 'Add to Cart', match: :first

    assert has_css? "tr.line-item-highlight"
  end
end
