class LesionesController < ApplicationController
  before_action :set_lesion, only: [:show, :edit, :update, :destroy]

  # GET /lesiones
  # GET /lesiones.json
  def index
    @lesiones = Lesion.all
  end

  # GET /lesiones/1
  # GET /lesiones/1.json
  def show
  end

  # GET /lesiones/new
  def new
    @lesion = Lesion.new
  end

  # GET /lesiones/1/edit
  def edit
  end

  # POST /lesiones
  # POST /lesiones.json
  def create
    @lesion = Lesion.new(lesion_params)

    respond_to do |format|
      if @lesion.save
        format.html { redirect_to @lesion, notice: 'Lesion was successfully created.' }
        format.json { render :show, status: :created, location: @lesion }
      else
        format.html { render :new }
        format.json { render json: @lesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesiones/1
  # PATCH/PUT /lesiones/1.json
  def update
    respond_to do |format|
      if @lesion.update(lesion_params)
        format.html { redirect_to @lesion, notice: 'Lesion was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesion }
      else
        format.html { render :edit }
        format.json { render json: @lesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesiones/1
  # DELETE /lesiones/1.json
  def destroy
    @lesion.destroy
    respond_to do |format|
      format.html { redirect_to lesiones_url, notice: 'Lesion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesion
      @lesion = Lesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesion_params
      params.require(:lesion).permit(:descripcion, :estatus, :TipoLesion_id)
    end
end