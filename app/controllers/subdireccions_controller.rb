class SubdireccionsController < ApplicationController
  before_action :set_subdireccion, only: %i[ show edit update destroy ]

  # GET /subdireccions or /subdireccions.json
  def index
    @subdireccions = Subdireccion.all
  end

  # GET /subdireccions/1 or /subdireccions/1.json
  def show
  end

  # GET /subdireccions/new
  def new
    @subdireccion = Subdireccion.new
  end

  # GET /subdireccions/1/edit
  def edit
  end

  # POST /subdireccions or /subdireccions.json
  def create
    @subdireccion = Subdireccion.new(subdireccion_params)

    respond_to do |format|
      if @subdireccion.save
        format.html { redirect_to @subdireccion, notice: "Subdireccion was successfully created." }
        format.json { render :show, status: :created, location: @subdireccion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subdireccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subdireccions/1 or /subdireccions/1.json
  def update
    respond_to do |format|
      if @subdireccion.update(subdireccion_params)
        format.html { redirect_to @subdireccion, notice: "Subdireccion was successfully updated." }
        format.json { render :show, status: :ok, location: @subdireccion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subdireccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subdireccions/1 or /subdireccions/1.json
  def destroy
    @subdireccion.destroy
    respond_to do |format|
      format.html { redirect_to subdireccions_url, notice: "Subdireccion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subdireccion
      @subdireccion = Subdireccion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subdireccion_params
      params.require(:subdireccion).permit(:nombre)
    end
end
