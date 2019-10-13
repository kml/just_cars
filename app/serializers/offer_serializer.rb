class OfferSerializer < ApplicationSerializer
  attribute :id
  attribute :title
  attribute :price
  attribute :description
  attribute :photo

  def description
    object.description.to_s
  end

  def photo
    return unless object.photo.attached?

    {
      path: rails_blob_path(object.photo)
    }
  end
end
