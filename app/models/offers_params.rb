class OffersParams
  include Virtus.model
  include ActiveModel::Validations

  attribute :id, Integer
  attribute :page, Integer, default: 1
  attribute :price_gte, BigDecimal
  attribute :price_lte, BigDecimal
  attribute :title, String

  validates :id, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}, allow_nil: true
  validates :page, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :price_gte, numericality: {greater_than_or_equal_to: 0}, allow_nil: true
  validates :price_lte, numericality: {greater_than: 0}, allow_nil: true
  validates :title, presence: true, allow_nil: true

  validate do
    if price_lte && price_gte && price_lte < price_gte
      errors.add(:price_lte, :invalid)
    end
  end

  def self.attributes_names
    attribute_set.map(&:name)
  end
end
