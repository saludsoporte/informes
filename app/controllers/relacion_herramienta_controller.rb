class RelacionHerramientaController < ApplicationController
  before_action :set_relacion_herramientum, only: %i[ show edit update destroy ]

  # GET /relacion_herramienta or /relacion_herramienta.json
  def index
    @relacion_herramienta = RelacionHerramientum.all
  end

  # GET /relacion_herramienta/1 or /relacion_herramienta/1.json
  def show
  end

  # GET /relacion_herramienta/new
  def new
    @relacion_herramientum = RelacionHerramientum.new
  end

  # GET /relacion_herramienta/1/edit
  def edit
  end

  # POST /relacion_herramienta or /relacion_herramienta.json
  def create
    @relacion_herramientum = RelacionHerramientum.new(relacion_herramientum_params)

    respond_to do |format|
      if @relacion_herramientum.save
        format.html { redirect_to @relacion_herramientum, notice: "Relacion herramientum was successfully created." }
        format.json { render :show, status: :created, location: @relacion_herramientum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @relacion_herramientum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relacion_herramienta/1 or /relacion_herramienta/1.json
  def update
    respond_to do |format|
      if @relacion_herramientum.update(relacion_herramientum_params)
        format.html { redirect_to @relacion_herramientum, notice: "Relacion herramientum was successfully updated." }
        format.json { render :show, status: :ok, location: @relacion_herramientum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @relacion_herramientum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relacion_herramienta/1 or /relacion_herramienta/1.json
  def destroy
    @relacion_herramientum.destroy
    respond_to do |format|
      format.html { redirect_to relacion_herramienta_url, notice: "Relacion herramientum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relacion_herramientum
      @relacion_herramientum = RelacionHerramientum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def relacion_herramientum_params
      params.require(:relacion_herramientum).permit(:informe_general_id, :herramienta_id)
    end
end
