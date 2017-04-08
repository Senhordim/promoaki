class Ad::PromotionsController < ApplicationController
  layout 'ad'

  before_action :set_promotion, only: [:update, :edit]
    
  def new
    @promotion = Promotion.new
    
  end

  def index
    @promotion = Promotion.where(store_id: current_store.id)
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to ad_promotion_path(@promotion), notice: 'Promoção criada com sucesso.'
    else
      render :new, notice: "corrija os erros"
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to ad_promotions_path, notice: 'Promoção atualizada com sucesso' }
        format.json { render :show, status: :ok, location: @promotion }
      else
        format.html { render :edit }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy

    respond_to do |format|
      format.html { redirect_to ad_promotions_path, notice: 'Promoção deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

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

    def set_promotion
      @promotion = Promotion.find(params[:id])
    end
end
