class PerfilsController < ApplicationController
  before_action :set_perfil, only: %i[ show edit update destroy ]

  # GET /perfils or /perfils.json
  def index
    if params[:user_id].nil?
      @perfils = Perfil.all
    else
      @perfils=Perfil.where(user_id:params[:user_id])
    end
  end

  # GET /perfils/1 or /perfils/1.json
  def show
  end

  # GET /perfils/new
  def new
    @perfil = Perfil.new
  end

  # GET /perfils/1/edit
  def edit
    #@perfil = Perfil.find(params[:id])
  end

  # POST /perfils or /perfils.json
  def create
    @perfil = Perfil.new(perfil_params)

    respond_to do |format|
      if @perfil.save
        format.html { redirect_to @perfil, notice: "Perfil was successfully created." }
        format.json { render :show, status: :created, location: @perfil }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfils/1 or /perfils/1.json
  def update
    respond_to do |format|
      if @perfil.update(perfil_params)
        format.html { redirect_to @perfil, notice: "El perfil ha sido actualizado." }
        format.json { render :show, status: :ok, location: @perfil }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfils/1 or /perfils/1.json
  def destroy
    @perfil.destroy
    respond_to do |format|
      format.html { redirect_to perfils_url, notice: "El perfil fue destruido satisfactoriamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perfil_params      
      params.require(:perfil).permit(:rol_id,:user_id)
    end
end
