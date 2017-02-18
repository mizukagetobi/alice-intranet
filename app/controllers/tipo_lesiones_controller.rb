class TipoLesionesController < ApplicationController
  before_action :set_tipo_lesion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_lesiones
  # GET /tipo_lesiones.json
  def index
    @tipo_lesiones = TipoLesion.all
  end

  # GET /tipo_lesiones/1
  # GET /tipo_lesiones/1.json
  def show
  end

  # GET /tipo_lesiones/new
  def new
    @tipo_lesion = TipoLesion.new
  end

  # GET /tipo_lesiones/1/edit
  def edit
  end

  # POST /tipo_lesiones
  # POST /tipo_lesiones.json
  def create
    @tipo_lesion = TipoLesion.new(tipo_lesion_params)

    respond_to do |format|
      if @tipo_lesion.save
        format.html { redirect_to @tipo_lesion, notice: 'Tipo lesion was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_lesion }
      else
        format.html { render :new }
        format.json { render json: @tipo_lesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_lesiones/1
  # PATCH/PUT /tipo_lesiones/1.json
  def update
    respond_to do |format|
      if @tipo_lesion.update(tipo_lesion_params)
        format.html { redirect_to @tipo_lesion, notice: 'Tipo lesion was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_lesion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_lesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_lesiones/1
  # DELETE /tipo_lesiones/1.json
  def destroy
    @tipo_lesion.destroy
    respond_to do |format|
      format.html { redirect_to tipo_lesiones_url, notice: 'Tipo lesion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_lesion
      @tipo_lesion = TipoLesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_lesion_params
      params.require(:tipo_lesion).permit(:descripcion, :estatus)
    end
end