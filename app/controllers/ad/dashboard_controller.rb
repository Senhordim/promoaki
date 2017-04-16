class Ad::DashboardController <  AdController

  def index
  	@count_promotion = Promotion.where(store: current_store).count
  end

end
