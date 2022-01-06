class InformeCtrlDocumsController < ApplicationController
  before_action :set_informe_ctrl_docum, only: %i[ show edit update destroy ]

  # GET /informe_ctrl_docums or /informe_ctrl_docums.json
  def index
    @informe_ctrl_docums = InformeCtrlDocum.all
  end

  # GET /informe_ctrl_docums/1 or /informe_ctrl_docums/1.json
  def show
  end

  # GET /informe_ctrl_docums/new
  def new
    @informe_ctrl_docum = InformeCtrlDocum.new
  end

  # GET /informe_ctrl_docums/1/edit
  def edit
  end

  # POST /informe_ctrl_docums or /informe_ctrl_docums.json
  def create
    @informe_ctrl_docum = InformeCtrlDocum.new(informe_ctrl_docum_params)

    respond_to do |format|
      if @informe_ctrl_docum.save
        format.html { redirect_to @informe_ctrl_docum, notice: "Informe ctrl docum was successfully created." }
        format.json { render :show, status: :created, location: @informe_ctrl_docum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @informe_ctrl_docum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informe_ctrl_docums/1 or /informe_ctrl_docums/1.json
  def update
    respond_to do |format|
      if @informe_ctrl_docum.update(informe_ctrl_docum_params)
        format.html { redirect_to @informe_ctrl_docum, notice: "Informe ctrl docum was successfully updated." }
        format.json { render :show, status: :ok, location: @informe_ctrl_docum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @informe_ctrl_docum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informe_ctrl_docums/1 or /informe_ctrl_docums/1.json
  def destroy
    @informe_ctrl_docum.destroy
    respond_to do |format|
      format.html { redirect_to informe_ctrl_docums_url, notice: "Informe ctrl docum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informe_ctrl_docum
      @informe_ctrl_docum = InformeCtrlDocum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def informe_ctrl_docum_params
      params.require(:informe_ctrl_docum).permit(:fecha_doc, :herramientum_id, :nombre_informe, :user_id)
    end
end
