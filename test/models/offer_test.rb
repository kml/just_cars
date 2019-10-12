require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  test "title blank is invalid" do
    offer = Offer.new(title: nil)
    assert offer.invalid?
    assert offer.errors[:title].present?
  end

  test "description blank is invalid" do
    offer = Offer.new(description: nil)
    assert offer.invalid?
    assert offer.errors[:description].present?
  end

  test "price blank is invalid" do
    offer = Offer.new(price: nil)
    assert offer.invalid?
    assert offer.errors[:price].present?
  end

  test "price negative is invalid" do
    offer = Offer.new(price: -1)
    assert offer.invalid?
    assert offer.errors[:price].present?
  end

  test "price zero is invalid" do
    offer = Offer.new(price: -1)
    assert offer.invalid?
    assert offer.errors[:price].present?
  end
end
