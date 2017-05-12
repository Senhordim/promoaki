class Panel::StoresController < PanelController

  before_action :set_store, only:[ :show, :edit, :update, :destroy]

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
    @store.build_address
  end

  def create
    binding.pry
    @store = Store.new(store_params)
    if @store.save
      redirect_to panel_store_path(@store), notice: 'Loja criada com sucesso!'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @store.update(store_params)
      redirect_to panel_store_path(@store), notice: 'Loja criada com sucess!'
    else
      render :new
    end
  end

  def destroy
    @store.destroy
    redirect_to panel_stores_path, notice: 'Loja removida com sucesso!'
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    password = params[:store][:password]
    password_confirmation = params[:store][:password_confirmation]

    if password.blank? && password_confirmation.blank?
      params[:store].except!(:password, :password_confirmation)
    end
    params.require(:store).permit(
      :email,
      :password,
      :password_confirmation,
      :social_name,
      :fantasy_name,
      :cnpj,
      :phone,
      address_attributes: [
        :street,
        :neighborhood,
        :zip_code,
        :numb,
        :complement,
        :city,
        :state,
        :country
      ]
    )
  end

end
