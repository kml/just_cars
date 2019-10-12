class Offer < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, presence: true

  has_rich_text :description
end
