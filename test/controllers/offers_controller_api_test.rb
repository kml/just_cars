require 'test_helper'

class OffersControllerApiTest < ActionDispatch::IntegrationTest
  setup do
    Offer.delete_all
    FactoryBot.create(:offer, price: 1_000)
    FactoryBot.create(:offer, price: 2_000, title: "Porsche Panamera")
    @offer3= FactoryBot.create(:offer, price: 3_000)
  end

  def sorted_prices
    JSON.parse(response.body).map { |o| o.fetch("price") }.sort
  end

  test "id" do
    get offers_url, params: {id: @offer3.id, format: :json}
    assert_response :success
    assert_equal ["3000.0"], sorted_prices
  end

  test "page 2" do
    get offers_url, params: {page: 2, format: :json}
    assert_response :success
    assert_empty JSON.parse(response.body)
  end

  test "price_gte" do
    get offers_url, params: {price_gte: 2_000, format: :json}
    assert_response :success
    assert_equal ["2000.0", "3000.0"], sorted_prices
  end

  test "price_lte" do
    get offers_url, params: {price_lte: 2_000, format: :json}
    assert_response :success
    assert_equal ["1000.0", "2000.0"], sorted_prices
  end

  test "price_gte and price_lte" do
    get offers_url, params: {price_gte: 2_000, price_lte: 2_000, format: :json}
    assert_response :success
    assert_equal ["2000.0"], sorted_prices
  end

  test "title" do
    get offers_url, params: {title: "panamera", format: :json}
    assert_response :success
    assert_equal ["2000.0"], sorted_prices
  end
end
