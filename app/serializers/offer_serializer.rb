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
      path: Rails.application.routes.url_helpers.rails_blob_path(object.photo, only_path: true)
    }
  end
end
