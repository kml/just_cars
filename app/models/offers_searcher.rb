class OffersSearcher
  attr_reader :params, :scope

  def initialize(params, scope: Offer.all)
    @params = params
    @scope = scope
  end

  def call
    offers = scope

    if params.id
      offers = offers.where(id: params.id)
    end

    if params.price_gte
      offers = offers.where("price >= ?", params.price_gte)
    end

    if params.price_lte
      offers = offers.where("price <= ?", params.price_lte)
    end

    if params.title
      title = Offer.arel_table[:title]
      offers = offers.where(title.matches("%#{sanitized_title}%"))
    end

    offers.page(params.page)
  end

  private

  def sanitized_title
    ActiveRecord::Base.sanitize_sql_like(params.title)
  end
end
