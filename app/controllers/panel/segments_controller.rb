class Panel::SegmentsController < PanelController

  before_action :set_segment, only: [ :edit, :update, :destroy]

  def index
    @segments = Segment.all
  end

  def new
    @segment = Segment.new
  end

  def create
    @segment = Segment.new(segment_params)
    if @segment.save
      redirect_to panel_segments_path, notice: 'Segmento criado com sucesso!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @segment.update(segment_params)
      redirect_to panel_segments_path, notice: "Segmento atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @segment.destroy
      redirect_to panel_segments_path, notice: "Segmento removido com sucesso!"
    else
      render :index
    end
  end

  private

  def set_segment
    @segment = Segment.find(params[:id])
  end

  def segment_params
    params.require(:segment).permit(:name)
  end

end
