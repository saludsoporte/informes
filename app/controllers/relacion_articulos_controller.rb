class RelacionArticulosController < ApplicationController
  before_action :set_relacion_articulo, only: %i[ show edit update destroy ]

  # GET /relacion_articulos or /relacion_articulos.json
  def index
    @relacion_articulos = RelacionArticulo.all
  end

  # GET /relacion_articulos/1 or /relacion_articulos/1.json
  def show
  end

  # GET /relacion_articulos/new
  def new
    @relacion_articulo = RelacionArticulo.new
  end

  # GET /relacion_articulos/1/edit
  def edit
  end

  # POST /relacion_articulos or /relacion_articulos.json
  def create
    @relacion_articulo = RelacionArticulo.new(relacion_articulo_params)

    respond_to do |format|
      if @relacion_articulo.save
        format.html { redirect_to @relacion_articulo, notice: "Relacion articulo was successfully created." }
        format.json { render :show, status: :created, location: @relacion_articulo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @relacion_articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relacion_articulos/1 or /relacion_articulos/1.json
  def update
    respond_to do |format|
      if @relacion_articulo.update(relacion_articulo_params)
        format.html { redirect_to @relacion_articulo, notice: "Relacion articulo was successfully updated." }
        format.json { render :show, status: :ok, location: @relacion_articulo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @relacion_articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relacion_articulos/1 or /relacion_articulos/1.json
  def destroy
    @relacion_articulo.destroy
    respond_to do |format|
      format.html { redirect_to relacion_articulos_url, notice: "Relacion articulo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relacion_articulo
      @relacion_articulo = RelacionArticulo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def relacion_articulo_params
      params.require(:relacion_articulo).permit(:articulo_id, :herramienta_id)
    end
end
