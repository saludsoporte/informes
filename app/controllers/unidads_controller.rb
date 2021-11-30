class UnidadsController < ApplicationController
  before_action :set_unidad, only: %i[ show edit update destroy ]

  # GET /unidads or /unidads.json
  def index
    @unidads = Unidad.all
  end

  # GET /unidads/1 or /unidads/1.json
  def show
  end

  # GET /unidads/new
  def new
    @unidad = Unidad.new
  end

  # GET /unidads/1/edit
  def edit
  end

  # POST /unidads or /unidads.json
  def create
    @unidad = Unidad.new(unidad_params)

    respond_to do |format|
      if @unidad.save
        format.html { redirect_to @unidad, notice: "Unidad was successfully created." }
        format.json { render :show, status: :created, location: @unidad }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidads/1 or /unidads/1.json
  def update
    respond_to do |format|
      if @unidad.update(unidad_params)
        format.html { redirect_to @unidad, notice: "Unidad was successfully updated." }
        format.json { render :show, status: :ok, location: @unidad }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidads/1 or /unidads/1.json
  def destroy
    @unidad.destroy
    respond_to do |format|
      format.html { redirect_to unidads_url, notice: "Unidad was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidad
      @unidad = Unidad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unidad_params
      params.require(:unidad).permit(:nombre)
    end
end
