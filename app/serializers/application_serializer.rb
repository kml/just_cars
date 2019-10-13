class ApplicationSerializer
  private

  def h
    Rails.application.routes.url_helpers
  end

  def rails_blob_path(blob)
    h.rails_blob_path(blob, only_path: true)
  end
end
