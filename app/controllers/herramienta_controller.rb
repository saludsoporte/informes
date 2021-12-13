class HerramientaController < ApplicationController
  before_action :set_herramientum, only: %i[ show edit update destroy ]

  # GET /herramienta or /herramienta.json
  def index
    @herramienta = Herramientum.all
  end

  # GET /herramienta/1 or /herramienta/1.json
  def show
  end

  # GET /herramienta/new
  def new
    @herramientum = Herramientum.new
  end

  # GET /herramienta/1/edit
  def edit
  end

  # POST /herramienta or /herramienta.json
  def create
    @herramientum = Herramientum.new(herramientum_params)

    respond_to do |format|
      if @herramientum.save
        format.html { redirect_to @herramientum, notice: "Herramientum was successfully created." }
        format.json { render :show, status: :created, location: @herramientum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @herramientum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /herramienta/1 or /herramienta/1.json
  def update
    respond_to do |format|
      if @herramientum.update(herramientum_params)
        format.html { redirect_to @herramientum, notice: "Herramientum was successfully updated." }
        format.json { render :show, status: :ok, location: @herramientum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @herramientum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /herramienta/1 or /herramienta/1.json
  def destroy
    @herramientum.destroy
    respond_to do |format|
      format.html { redirect_to herramienta_url, notice: "Herramientum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_herramientum
      @herramientum = Herramientum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def herramientum_params
      params.require(:herramientum).permit(:conexion_bd_id, :nombre_sistema)
    end
end
