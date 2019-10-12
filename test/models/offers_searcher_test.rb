require 'test_helper'

class OffersSearcherTest < ActiveSupport::TestCase
  setup do
    Offer.delete_all
    FactoryBot.create(:offer, price: 1_000)
    FactoryBot.create(:offer, price: 2_000)
    FactoryBot.create(:offer, price: 3_000)
  end

  test "count all" do
    assert_equal 3, OffersSearcher.new(OffersParams.new).call.total_count
  end

  test "price_gte" do
    assert_equal 2, OffersSearcher.new(OffersParams.new(price_gte: 2_000)).call.total_count
  end

  test "price_lte" do
    assert_equal 2, OffersSearcher.new(OffersParams.new(price_lte: 2_500)).call.total_count
  end

  test "price_gte and price_lte" do
    assert_equal 1, OffersSearcher.new(OffersParams.new(price_gte: 1_500, price_lte: 2_500)).call.total_count
  end
end
