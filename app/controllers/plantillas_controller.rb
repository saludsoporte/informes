class PlantillasController < ApplicationController
  before_action :set_plantilla, only: %i[ show edit update destroy ]

  # GET /plantillas or /plantillas.json
  def index
    @plantillas = Plantilla.all
  end

  # GET /plantillas/1 or /plantillas/1.json
  def show
  end

  # GET /plantillas/new
  def new
    @plantilla = Plantilla.new
  end

  # GET /plantillas/1/edit
  def edit
  end

  def cargar_plantilla
    @plantilla=Plantilla.where(herramientum_id:params[:herramienta_id])
    render :partial => "herr_index" , :object => @plantilla 
  end

  # POST /plantillas or /plantillas.json
  def create
    @herramienta=Herramientum.find(plantilla_params[:herramientum_id])    
    @plantilla=@herramienta.plantillas.create(plantilla_params)
    #@plantilla = Plantilla.new(plantilla_params)

    respond_to do |format|
      if @plantilla.save
        format.html { redirect_to @plantilla, notice: "Plantilla was successfully created." }
        format.json { render :show, status: :created, location: @plantilla }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plantilla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plantillas/1 or /plantillas/1.json
  def update
    respond_to do |format|
      if @plantilla.update(plantilla_params)
        format.html { redirect_to @plantilla, notice: "Plantilla was successfully updated." }
        format.json { render :show, status: :ok, location: @plantilla }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plantilla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plantillas/1 or /plantillas/1.json
  def destroy
    @plantilla.destroy
    respond_to do |format|
      format.html { redirect_to plantillas_url, notice: "Plantilla was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plantilla
      @plantilla = Plantilla.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plantilla_params
      #params[:plantilla][:herramientum_id]=params[:herramienta_id]
      params.require(:plantilla).permit(:herramientum_id, :dato_id)
    end
end
