class ConexionBdsController < ApplicationController
  before_action :set_conexion_bd, only: %i[ show edit update destroy ]

  # GET /conexion_bds or /conexion_bds.json
  def index
    @conexion_bds = ConexionBd.all
  end

  # GET /conexion_bds/1 or /conexion_bds/1.json
  def show
  end

  # GET /conexion_bds/new
  def new
    @conexion_bd = ConexionBd.new
  end

  # GET /conexion_bds/1/edit
  def edit
  end

  # POST /conexion_bds or /conexion_bds.json
  def create
    @conexion_bd = ConexionBd.new(conexion_bd_params)

    respond_to do |format|
      if @conexion_bd.save
        format.html { redirect_to @conexion_bd, notice: "Conexion bd was successfully created." }
        format.json { render :show, status: :created, location: @conexion_bd }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conexion_bd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conexion_bds/1 or /conexion_bds/1.json
  def update
    respond_to do |format|
      if @conexion_bd.update(conexion_bd_params)
        format.html { redirect_to @conexion_bd, notice: "Conexion bd was successfully updated." }
        format.json { render :show, status: :ok, location: @conexion_bd }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conexion_bd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conexion_bds/1 or /conexion_bds/1.json
  def destroy
    @conexion_bd.destroy
    respond_to do |format|
      format.html { redirect_to conexion_bds_url, notice: "Conexion bd was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conexion_bd
      @conexion_bd = ConexionBd.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conexion_bd_params
      params.require(:conexion_bd).permit(:nombre)
    end
end
