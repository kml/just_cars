class OfferSerializer < ActiveModel::Serializer
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

  private

  def h
    Rails.application.routes.url_helpers
  end

  def rails_blob_path(blob)
    h.rails_blob_path(blob, only_path: true)
  end
end
