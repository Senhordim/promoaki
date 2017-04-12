class Ad::PromotionsController < AdController

  before_action :set_promotion, only: [:update, :edit, :show, :destroy]

  def new
    @promotion = Promotion.new
  end

  def index
    @promotions = Promotion.where(store_id: current_store.id)
  end

  def show
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
