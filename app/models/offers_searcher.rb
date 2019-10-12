class OffersSearcher
  attr_reader :params, :scope

  def initialize(params, scope: Offer.all)
    @params = params
    @scope = scope
  end

  def call
    offers = scope

    if params.price_gte
      offers = offers.where("price >= ?", params.price_gte)
    end

    if params.price_lte
      offers = offers.where("price <= ?", params.price_lte)
    end

    offers.page(params.page)
  end
end
