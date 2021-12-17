class RelacionEntradaUnidadsController < ApplicationController
  before_action :set_relacion_entrada_unidad, only: %i[ show edit update destroy ]

  # GET /relacion_entrada_unidads or /relacion_entrada_unidads.json
  def index
    @relacion_entrada_unidads = RelacionEntradaUnidad.all
  end

  # GET /relacion_entrada_unidads/1 or /relacion_entrada_unidads/1.json
  def show
  end

  # GET /relacion_entrada_unidads/new
  def new
    @relacion_entrada_unidad = RelacionEntradaUnidad.new
  end

  # GET /relacion_entrada_unidads/1/edit
  def edit
  end

  # POST /relacion_entrada_unidads or /relacion_entrada_unidads.json
  def create
    @relacion_entrada_unidad = RelacionEntradaUnidad.new(relacion_entrada_unidad_params)

    respond_to do |format|
      if @relacion_entrada_unidad.save
        format.html { redirect_to @relacion_entrada_unidad, notice: "Relacion entrada unidad was successfully created." }
        format.json { render :show, status: :created, location: @relacion_entrada_unidad }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @relacion_entrada_unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relacion_entrada_unidads/1 or /relacion_entrada_unidads/1.json
  def update
    respond_to do |format|
      if @relacion_entrada_unidad.update(relacion_entrada_unidad_params)
        format.html { redirect_to @relacion_entrada_unidad, notice: "Relacion entrada unidad was successfully updated." }
        format.json { render :show, status: :ok, location: @relacion_entrada_unidad }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @relacion_entrada_unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relacion_entrada_unidads/1 or /relacion_entrada_unidads/1.json
  def destroy
    @relacion_entrada_unidad.destroy
    respond_to do |format|
      format.html { redirect_to relacion_entrada_unidads_url, notice: "Relacion entrada unidad was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relacion_entrada_unidad
      @relacion_entrada_unidad = RelacionEntradaUnidad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def relacion_entrada_unidad_params
      params.require(:relacion_entrada_unidad).permit(:informe_general_id, :unidad_id, :caducado, :necesita, :por_caducar, :existencia_fisica, :buen_estado, :extra)
    end
end
