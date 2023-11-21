require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

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

  test "should sent email to admin when error is raised" do
    visit product_url(Product.maximum(:id).to_i + 1)

    perform_enqueued_jobs
    perform_enqueued_jobs
    assert_performed_jobs 2

    mail = ActionMailer::Base.deliveries.last
    assert_equal ["admin@example.com"], mail.to
    assert_equal "from@example.com", mail[:from].value
    assert_equal "Application Errors", mail.subject

    assert_text "Invalid product"
  end
end
