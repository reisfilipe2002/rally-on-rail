require "test_helper"

class CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get brand:text" do
    get cars_brand:text_url
    assert_response :success
  end

  test "should get model:text" do
    get cars_model:text_url
    assert_response :success
  end

  test "should get price:integer" do
    get cars_price:integer_url
    assert_response :success
  end

  test "should get user:references" do
    get cars_user:references_url
    assert_response :success
  end
end
