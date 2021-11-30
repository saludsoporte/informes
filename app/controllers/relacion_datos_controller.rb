class RelacionDatosController < ApplicationController
  before_action :set_relacion_dato, only: %i[ show edit update destroy ]

  # GET /relacion_datos or /relacion_datos.json
  def index
    @relacion_datos = RelacionDato.all
  end

  # GET /relacion_datos/1 or /relacion_datos/1.json
  def show
  end

  # GET /relacion_datos/new
  def new
    @relacion_dato = RelacionDato.new
  end

  # GET /relacion_datos/1/edit
  def edit
  end

  # POST /relacion_datos or /relacion_datos.json
  def create
    @relacion_dato = RelacionDato.new(relacion_dato_params)

    respond_to do |format|
      if @relacion_dato.save
        format.html { redirect_to @relacion_dato, notice: "Relacion dato was successfully created." }
        format.json { render :show, status: :created, location: @relacion_dato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @relacion_dato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relacion_datos/1 or /relacion_datos/1.json
  def update
    respond_to do |format|
      if @relacion_dato.update(relacion_dato_params)
        format.html { redirect_to @relacion_dato, notice: "Relacion dato was successfully updated." }
        format.json { render :show, status: :ok, location: @relacion_dato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @relacion_dato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relacion_datos/1 or /relacion_datos/1.json
  def destroy
    @relacion_dato.destroy
    respond_to do |format|
      format.html { redirect_to relacion_datos_url, notice: "Relacion dato was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relacion_dato
      @relacion_dato = RelacionDato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def relacion_dato_params
      params.require(:relacion_dato).permit(:herramienta_id, :dato_id, :valo)
    end
end
