class Ad::PromotionsController < AdController

  before_action :set_promotion, only: [:update, :edit, :show, :destroy]

  has_scope :by_cod
  has_scope :by_period



  def index
    @promotions = apply_scopes(Promotion).where(store_id: current_store.id).order(created_at: :desc)
    # @promotions = apply_scopes(Promotion).all

  end

  def show
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to ad_promotion_path(@promotion), notice: 'Promoção criada com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @promotion.update(promotion_params)
      redirect_to ad_promotions_path, notice: 'Promoção atualizada com sucesso'
    else
      render :edit
    end
  end

  def destroy
    @promotion.destroy
    redirect_to ad_promotions_path, notice: 'Promoção deletada com sucesso.'
  end

  private

  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  def promotion_params
    params.require(:promotion).permit(
       :title,
       :description,
       :quantity,
       :endDate,
       :segment_id,
       :store_id
      )
  end
end
