require "test_helper"

class CurrencyControllerTest < ActionDispatch::IntegrationTest
  test "should get price" do
    get currency_price_url
    assert_response :success
  end
end
