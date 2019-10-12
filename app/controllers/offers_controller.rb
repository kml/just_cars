class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /offers
  # GET /offers.json
  def index
    @offer_params = OffersParams.new(search_params.slice(*OffersParams.attributes_names))

    respond_to do |format|
      format.html do
        OffersParams.attributes_names.each do |name|
          @offer_params[name] = nil if @offer_params[name] == ""
        end

        if @offer_params.valid?
          @offers = OffersSearcher.new(@offer_params).call
        else
          @offers = Kaminari.paginate_array([]).page(1)
        end

        render :index
      end

      format.json do
        if @offer_params.invalid?
          render json: offer_params.errors, status: :unprocessable_entity
        else
          render json: OffersSearcher.new(@offer_params).call, each_serializer: OfferSerializer
        end
      end
    end
  end

  # GET /offers/1
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to @offer, notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render json: @offer, status: :ok, serializer: OfferSerializer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  def destroy
    @offer.destroy
    redirect_to offers_url, notice: 'Offer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def offer_params
      params.require(:offer).permit(:title, :description, :price, :photo)
    end

    def search_params
      params.permit(OffersParams.attributes_names)
    end
end
