require 'test_helper'

class OffersParamsTest < ActiveSupport::TestCase
  test "page negative is invalid" do
    params = OffersParams.new(page: -1)
    assert params.invalid?
    assert params.errors[:page].present?
  end

  test "price_gte negative is invalid" do
    params = OffersParams.new(price_gte: -1)
    assert params.invalid?
    assert params.errors[:price_gte].present?
  end

  test "price_lte negative is invalid" do
    params = OffersParams.new(price_lte: -1)
    assert params.invalid?
    assert params.errors[:price_lte].present?
  end

  test "price_lte can't be lower that price_gte" do
    params = OffersParams.new(price_gte: 2, price_lte: 1)
    assert params.invalid?
    assert params.errors[:price_lte].present?
  end
end
