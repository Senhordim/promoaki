class Panel::AdminsController < PanelController

  before_action :set_admin, only: [ :edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
    # @admins = Admin.with_full_access
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to panel_admins_path, notice: "Administrador criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to panel_admins_path, notice: "Administrador atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    if @admin.destroy
      redirect_to panel_admins_path, notice: "Administrador removido com sucesso!"
    else
      render :index
    end
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      password = params[:admin][:password]
      password_confirmation = params[:admin][:password_confirmation]
      if password.blank? && password_confirmation.blank?
        params[:admin].except!(:password, :password_confirmation)
      end
      params.require(:admin).permit(policy(@admin).permitted_attributes)
    end

end

