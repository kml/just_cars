require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  test "title blank is invalid" do
    offer = Offer.new(title: nil)
    offer.valid?
    assert offer.errors[:title].present?
  end

  test "description blank is invalid" do
    offer = Offer.new(description: nil)
    offer.valid?
    assert offer.errors[:description].present?
  end

  test "price blank is invalid" do
    offer = Offer.new(price: nil)
    offer.valid?
    assert offer.errors[:price].present?
  end

  test "price negative is invalid" do
    offer = Offer.new(price: -1)
    offer.valid?
    assert offer.errors[:price].present?
  end

  test "price zero is invalid" do
    offer = Offer.new(price: -1)
    offer.valid?
    assert offer.errors[:price].present?
  end
end
