class InformeGeneralsController < ApplicationController

  before_action :set_informe_general, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /informe_generals or /informe_generals.json
  def index
    @informe_generals = InformeGeneral.paginate(page:params[:page]).all
  end

  # GET /informe_generals/1 or /informe_generals/1.json
  def show
  end

  # GET /informe_generals/new
  def new
    @informe_general = InformeGeneral.new
  end

  # GET /informe_generals/1/edit
  def edit
  end

  # POST /informe_generals or /informe_generals.json
  def create
    @informe_general = InformeGeneral.new(informe_general_params)

    respond_to do |format|
      if @informe_general.save
        format.html { redirect_to @informe_general, notice: "Informe general was successfully created." }
        format.json { render :show, status: :created, location: @informe_general }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @informe_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informe_generals/1 or /informe_generals/1.json
  def update
    respond_to do |format|
      if @informe_general.update(informe_general_params)
        format.html { redirect_to @informe_general, notice: "Informe general was successfully updated." }
        format.json { render :show, status: :ok, location: @informe_general }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @informe_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informe_generals/1 or /informe_generals/1.json
  def destroy
    @informe_general.destroy
    respond_to do |format|
      format.html { redirect_to informe_generals_url, notice: "Informe general was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informe_general
      @informe_general = InformeGeneral.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def informe_general_params
      params.require(:informe_general).permit(:nombre)
    end
end
