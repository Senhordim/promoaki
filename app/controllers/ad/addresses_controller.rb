class Ad::AddressesController < ApplicationController

  layout "ad"

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

  def edit
  end

  def update
    respond_to do |format|
      if @address.update(course_params)
        format.html { redirect_to edit_store_registration_path, notice: 'Endereço atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
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
