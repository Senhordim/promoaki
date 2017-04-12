class Ad::AddressesController < AdController

  before_action :set_address, only: [:show, :edit, :update]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to ad_dashboard_index_path, notice: 'Endereço cadastrado com sucesso'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @address.update(course_params)
      redirect_to edit_store_registration_path, notice: 'Endereço atualizado com sucesso'
    else
      render :edit
    end
  end

  private

    def address_params
      params.require(:address).permit(
        :street,
        :neighborhood,
        :zip_code,
        :numb,
        :complement,
        :city,
        :state,
        :store_id
        )
    end

    def set_address
      @course = Address.find(params[:id])
    end

end
